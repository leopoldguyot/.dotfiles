# To install on fresh os:

- git
- stow
- [neovim](https://github.com/neovim/neovim)
- tmux
- zsh
- ["Oh My ZSH!"](https://ohmyz.sh/)
    - Theme: agnoster
    - git
    - command-not-found
    - sudo
- [zsh autocompletion](https://github.com/zsh-users/zsh-autosuggestions)
- fzf
- [alacritty](https://github.com/alacritty/alacritty)
- [TPM](https://github.com/tmux-plugins/tpm)
- [radian](https://github.com/randy3k/radian)
- [optional] File manager (thunar)
- [optional] emacs
- [optional(ubuntu)] nala

# To do on fresh install:

- Go to .dotfiles and run .local/bin/scripts/sync-dotfiles (ensure that no single file present in the dotfile is present in home)

-zsh will be preconfigured on the installation of oh my zsh

- Nothing to do for nvim (just check error message and install needed composants
## configuration of "oh my zsh"

Nothing to do but be aware that zsh autocompletion should be install after omz

PS: maybe omz will overide the .zshrc just replace it with existing zshrc file.

=> run
```bash
chsh -s $(which zsh)
```
# Fonts:

run in home/.fonts/ 
```bash
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.tar.xz
```code
