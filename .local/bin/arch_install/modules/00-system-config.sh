#!/usr/bin/env bash
set -e

echo "[Module] Configuring system locale"

# Enable required locales in /etc/locale.gen
sudo sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
sudo sed -i 's/^#fr_BE.UTF-8 UTF-8/fr_BE.UTF-8 UTF-8/' /etc/locale.gen

# Generate updated locales
sudo locale-gen

# System-wide locale configuration
cat <<EOF | sudo tee /etc/locale.conf >/dev/null
LANG=en_US.UTF-8
LC_NUMERIC=fr_BE.UTF-8
LC_TIME=fr_BE.UTF-8
EOF

# (Optional) Console keymap if using AZERTY in TTY
if [ ! -f /etc/vconsole.conf ]; then
    cat <<EOF | sudo tee /etc/vconsole.conf >/dev/null
KEYMAP=be-latin1
EOF
fi

echo "[Locale] en_US as main language with Belgian numeric/time formats configured."

