#!/usr/bin/env bash
set -e

source lib/helpers.sh

echo "[+] Arch Setup Starting"

for module in modules/*.sh; do
    echo "[+] Running $module"
    source "$module"
done

echo "[+] Done!"

