#!/usr/bin/env bash
set -e

ARCH_DIR="$HOME/.local/bin/arch_install"

echo "[Module] Installing AUR packages with paru"

# Make sure the AUR package list exists
if [ ! -f $ARCH_DIR/aur-pkgs-list.txt ]; then
    echo "ERROR: aur-pkgs-list.txt not found!"
    exit 1
fi

# Check if paru is installed
if ! command -v paru >/dev/null 2>&1; then
    echo "[+] paru not found, installing it..."

    # Install paru dependencies from pacman (required to build it)
    sudo pacman --needed --noconfirm -S base-devel git

    # Clone and build paru
    tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/paru.git "$tmpdir/paru"
    git clone https://aur.archlinux.org/paru.git
    cd "$tmpdir/paru"

    # Build and install paru
    makepkg -si --noconfirm

    # Clean temporary directory
    cd -
    rm -rf "$tmpdir"

    echo "[+] paru installed successfully."
else
    echo "[+] paru already installed."
fi

# Read AUR package list
aur_packages=$(grep -vE '^\s*#' $ARCH_DIR/aur-pkgs-list.txt | tr '\n' ' ')
if [[ -z "$aur_packages" ]]; then
    echo "[!] No AUR packages to install."
    exit 0
fi

echo "[+] Installing AUR packages: $aur_packages"
paru -S --needed --noconfirm $aur_packages

echo "[AUR] Installation complete."

