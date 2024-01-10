;; Base modification
(setq inhibit-startup-message t)
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(setq visible-bell t)       ; set up visible warnings
(add-to-list 'initial-frame-alist '(fullscreen . maximized)) ; Maximize the Emacs window on startup
(global-display-line-numbers-mode 1) ;show line numbers
(global-auto-revert-mode t) ; enable autosync for buffers
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook
		inferior-ess-mode-hook
		treemacs-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(menu-bar-mode 1)            ; Disable the menu bar

;; enable CUA mode with base option (cd doc)
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour


;; KEYBINDS

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(bind-key* "C-z" 'previous-line) ; allow to override the cua mode
(global-set-key (kbd "C-p") 'undo)

(global-set-key (kbd "C-s") 'next-line)
(global-set-key (kbd "C-n") 'swiper)

(global-set-key (kbd "C-d") 'forward-char)
(global-set-key (kbd "M-d") 'forward-word)
(global-set-key (kbd "C-f") 'delete-char)
(global-set-key (kbd "M-f") 'kill-word)

(global-set-key (kbd "C-q") 'backward-char)
(global-set-key (kbd "M-q") 'backward-word)
(global-set-key (kbd "C-b") 'quoted-insert)
(global-set-key (kbd "M-b") 'fill-paragraph)

;; PACKAGES ;;
;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package ivy
  :diminish ; emacs will not show the minor-mode in the line below
  :bind (("C-n" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-s" . ivy-next-line)
         ("C-z" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-z" . ivy-previous-line)
	 ("C-s" . ivy-next-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-z" . ivy-previous-line)
	 ("C-s" . ivy-next-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package counsel
  :bind(("M-x" . counsel-M-x)
	("C-x b" . counsel-ibuffer)
	("C-x C-f" . counsel-find-file)
	:map minibuffer-local-map
	("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil))

(use-package ivy-rich
  :after ivy)
(require 'ivy-rich)
(ivy-rich-mode 1)

(use-package ess
  :ensure t
  :bind*(
  	("C-<return>" . 'ess-eval-region-or-line-and-step)
  	("M--" . 'ess-insert-assign)
  	)
  )

(load "ess-autoloads")

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.5))

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

(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
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

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))


;; THEMING

(use-package doom-themes
  :init (load-theme 'doom-dark+ t))

(use-package all-the-icons)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e8ceeba381ba723b59a9abc4961f41583112fc7dc0e886d9fc36fa1dc37b4079" default))
 '(package-selected-packages '(doom-themes rainbow-delimiters counsel ivy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
