#!/usr/bin/env bash
set -e

ARCH_DIR="$HOME/.local/bin/arch_install"
echo "[Module] Updating pacman"
sudo pacman -Syu

echo "[Module] Installing pacman packages"
# Install official repo packages
pacman_packages=$(grep -v '^#' $ARCH_DIR/pacman-pkgs-list.txt | tr '\n' ' ')
if [[ -n "$pacman_packages" ]]; then
    echo "[+] Installing pacman packages"
    sudo pacman --noconfirm --needed -S $pacman_packages
fi

