
# Quick Start: New Computer Setup
1. Clone this repository

``` console
git clone https://github.com/<your-username>/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

2. Run the setup script

``` console
./.local/bin/scripts/setup-os
```
The setup script will:

- Detect your package manager (apt, dnf, or pacman)
- Update your system packages
- Install required tools
- Install and configure Oh My Zsh
- Install the tmux plugin manager (TPM)
- Optionally install i3 or Sway
- Synchronize your dotfiles using GNU Stow
- Optionally switch your default shell to Zsh
- Install the FiraMono Nerd Font
- Install or update programs built from source

3. Restart or log out/in

# Updating tools installed from source

All GitHub-based source builds (like Neovim, Alacritty, Ripgrep) are managed via:
`~/.config/source-tools.conf`

To update them or install a new entry:
``` console
update-source
```
To add new tools, simply append to source-tools.conf:
``` bash
# name | repo_url | build_command
fd | https://github.com/sharkdp/fd.git | cargo build --release && cp target/release/fd ~/.local/bin/
```

# Paths

| Path                          | Purpose                                     |
| ----------------------------- | ------------------------------------------- |
| `~/.dotfiles`                 | Your dotfiles repository (cloned here)      |
| `~/.local/bin`                | User-level binaries (installed tools)       |
| `~/.local/bin/scripts`        | Personal helper scripts                     |
| `~/.local/src`                | GitHub source repositories cloned for build |
| `~/.config/source-tools.conf` | Tool definitions for builds from source     |
| `~/.oh-my-zsh`                | Oh My Zsh framework                         |
| `~/.fonts`                    | Custom fonts (e.g., Nerd Fonts)             |


