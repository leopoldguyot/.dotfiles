# Dotfiles

My personal Linux setup: shell, editors, window manager config, and helper scripts.
Everything is managed from this repo and linked into `$HOME` with GNU Stow.

## Quick start

```console
git clone https://github.com/leopoldguyot/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./.local/bin/scripts/setup-os
```

`setup-os` handles package installation, shell setup, dotfile sync, fonts, and source-built tools.

If you prefer to sync manually:

```console
stow -d ~/.dotfiles -t ~ .
```

## Day-to-day usage

```console
sync-dotfiles               # pull + restow + backup conflicts
update-source               # update all tools from ~/.config/source-tools.conf
update-source <tool>        # update one source-built tool
sessionizer                 # zellij project/session picker
usb-mount                   # list/mount removable USB partitions
usb-transfer                # transfer files to/from mounted USB with rsync
usb-unmount                 # unmount USB partitions
```

All scripts in `~/.local/bin/scripts` support `--help`.

## Repository layout

| Path | Purpose |
| --- | --- |
| `.config/` | App configs (nvim, tmux, hypr, waybar, etc.) |
| `.local/bin/scripts/` | User-facing helper scripts |
| `.local/bin/arch_install/` | Arch-specific install/update flow |
| `keyboard_layouts/` | Keyboard layout assets |
| `bg/` | Wallpapers |
| `oh-my-zsh-custom/` | Zsh custom themes/plugins |
| `help.md` | Personal usage notes and shortcuts |

## Script index

| Script | What it does |
| --- | --- |
| `setup-os` | Bootstrap a fresh machine |
| `sync-dotfiles` | Pull latest dotfiles and re-stow |
| `update-source` / `install-from-source` | Build/update tools from source repos |
| `sessionizer` / `zellij_sessionizer` / `tmux-sess` | Session and project navigation |
| `keyboard-layout-switcher` | Switch active keyboard layout in Hyprland |
| `wallpaper-picker` | Pick and apply wallpaper on all monitors |
| `waybar-notifications` | Waybar JSON status from dunst |
| `waybar-player` | Waybar media text via playerctl |
| `waybar-resources` | Waybar CPU/memory/temperature status |
| `waybar-open-btop` | Open btop in an available terminal |
| `usb-mount` | List and mount removable USB partitions |
| `usb-transfer` | Transfer files to/from mounted USB partitions |
| `usb-unmount` | Unmount USB partitions (`--power-off` to also power off disk) |
| `print_pdfs` | Print PDFs under a folder with page limit filter |
| `update-hypr-keybinds-readme` | Generate Hyprland keybind README from config |
| `wifimenu` | Wi-Fi picker script |
| `installPkgsR.R` | Install/update R packages from `pkgListR.txt` |

## Arch helper scripts

The Arch-specific entrypoints also expose `--help`:

```console
~/.local/bin/arch_install/install-arch
~/.local/bin/arch_install/update-pkgs
```
