(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

(setq inhibit-startup-message t)
  (scroll-bar-mode -1)        ; Disable visible scrollbar
  (tool-bar-mode -1)          ; Disable the toolbar
  (tooltip-mode -1)           ; Disable tooltips
  (set-fringe-mode 10)        ; Give some breathing room
  (setq visible-bell t)       ; set up visible warnings
  (global-display-line-numbers-mode 1) ;show line numbers
  (global-auto-revert-mode t) ; enable autosync for buffers
  (dolist (mode '(term-mode-hook
                shell-mode-hook
                eshell-mode-hook
                inferior-ess-mode-hook
                treemacs-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

  (menu-bar-mode 1)            ; Disable the menu bar

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package general
  :config
  (general-create-definer lguyot/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (lguyot/leader-keys
    "t"  '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")
    "e" '(run-ess-r :which-key "start R with ESS")))

(use-package ivy
  :diminish
  :bind (:map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)    
         ("C-l" . ivy-alt-done)
         :map ivy-switch-buffer-map
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))


 (use-package ivy-rich
  :after ivy
  :config
  (ivy-rich-mode 1))

(use-package counsel
  :bind(("M-x" . counsel-M-x)
	("C-x b" . counsel-ibuffer)
	("C-x C-f" . counsel-find-file)
	:map minibuffer-local-map
	("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil))

(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.3))

(use-package helpful
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
         ("C-c C-e" . markdown-do)))

(use-package poly-R
  :ensure t
  :config
  (add-to-list 'auto-mode-alist
             '("\\.[rR]md\\'" . poly-gfm+r-mode)))

(use-package lsp-mode
  :after which-key
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . efs/lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))
  
  (use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))
(use-package lsp-treemacs
  :after lsp)
(use-package lsp-ivy)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package company
  :after lsp-mode
  :hook ((prog-mode . company-mode)
         (lsp-mode . company-mode)
         (emacs-lisp-mode . company-mode)) ;; Fixed hook
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0) ;; Immediate completion popup
  :bind ((:map company-active-map
         ("<tab>" . company-complete-selection)
         ("<return>" . nil)
         ("ESC" . company-abort))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))))
   ;; could use company-complete-selection


(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package ess
  :ensure t
  :bind*(
	("C-<return>" . 'ess-eval-region-or-line-and-step)
	("M--" . 'ess-insert-assign)
	)
  )

(use-package projectile
    :diminish projectile-mode
    :config (projectile-mode)
    :custom ((projectile-completion-system 'ivy))
    :bind-keymap
    ("C-c p" . projectile-command-map)
    :init
    ;; NOTE: Set this to the folder where you keep your Git repos!
    (when (file-directory-p "~/Documents/GitHub")
      (setq projectile-project-search-path '("~/Documents/GitHub")))
    (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
:after projectile
:config
(counsel-projectile-mode 1)
:bind (:map projectile-command-map
            ("p" . projectile-switch-project) ;; Use vanilla projectile
            ("P" . counsel-projectile-switch-project) ;; Alternative key for counsel version
            ("s g" . counsel-projectile-grep))) ;; Ensure ripgrep is correctly bound

(use-package doom-themes
  :ensure t
  :config (load-theme 'doom-dark+ t))

(use-package all-the-icons)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))
