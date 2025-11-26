#!/usr/bin/env bash

install_packages() {
    sudo pacman --needed --noconfirm -S "$@"
}

enable_service() {
    sudo systemctl enable "$1"
}

