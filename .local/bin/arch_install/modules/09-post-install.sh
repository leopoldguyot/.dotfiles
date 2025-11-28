# Vars

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/oh-my-zsh-custom}"
DOTFILES_BIN="${DOTFILES_BIN:-$HOME/.dotfiles/.local/bin/scripts}"
# install fonts

getnf -i FiraCode FiraMono

# Set zsh as default shell
CURRENT_SHELL=$(basename "$SHELL")
ZSH_PATH=$(which zsh)

if [ "$CURRENT_SHELL" != "zsh" ]; then
    echo
    read -rp "Do you want to change your default shell to Zsh? [y/N]: " change_shell
    case "$change_shell" in
        [yY]|[yY][eE][sS])
            chsh -s "$ZSH_PATH"
            echo "Default shell changed to Zsh. Please log out and back in for changes to take effect."
            ;;
        *)
            echo "Skipping changing default shell."
            ;;
    esac
fi

# Install omz
echo "Installing oh-my-zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c \
        "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

mkdir -p "$ZSH_CUSTOM/plugins"
for plugin in zsh-autosuggestions zsh-syntax-highlighting; do
    if [ ! -d "$ZSH_CUSTOM/plugins/$plugin" ]; then
        echo "Installing Zsh plugin: $plugin"
        git clone https://github.com/zsh-users/$plugin.git "$ZSH_CUSTOM/plugins/$plugin"
    else
        echo "Zsh plugin $plugin already installed, skipping."
    fi
done

# Stow dotfiles

$DOTFILES_BIN/sync-dotfiles

