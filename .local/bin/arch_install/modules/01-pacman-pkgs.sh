#!/usr/bin/env bash
set -e

echo "[Module] Installing pacman packages"

# Install official repo packages
pacman_packages=$(grep -v '^#' pacman-pkgs-list.txt | tr '\n' ' ')
if [[ -n "$pacman_packages" ]]; then
    echo "[+] Installing pacman packages"
    sudo pacman --noconfirm --needed -S $pacman_packages
fi

