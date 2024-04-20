# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Personal scripts:
export PATH=/home/leopoldguyot/.local/bin/scripts:$PATH

# Aliases:

alias vi='nvim'
alias svi='sudo nvim'
alias ls='ls --color=auto'
alias ll='ls -la'
alias cd..='cd ..'
alias ..='cd ..'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'
alias gits='git status'
alias gitall='git add .'
alias gitc='git commit'

# alias fedora:
alias install='sudo dnf install'
alias update='sudo dnf update'
alias search='sudo dnf search'


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/leopoldguyot/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Manually added: Zsh completion
fpath=(~/.zsh/zsh-completions/src $fpath)

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


source ~/powerlevel10k/powerlevel10k.zsh-theme
