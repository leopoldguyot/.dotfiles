#!/usr/bin/env bash
set -e

echo "[Module] Configuring system locale"

# Enable required locales in /etc/locale.gen
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
sed -i 's/^#fr_BE.UTF-8 UTF-8/fr_BE.UTF-8 UTF-8/' /etc/locale.gen

# Generate updated locales
locale-gen

# System-wide locale configuration
cat > /etc/locale.conf <<EOF
LANG=en_US.UTF-8
LC_NUMERIC=fr_BE.UTF-8
LC_TIME=fr_BE.UTF-8
EOF

# (Optional) Console keymap if using AZERTY in TTY
if [ ! -f /etc/vconsole.conf ]; then
    cat > /etc/vconsole.conf <<EOF
KEYMAP=be-latin1
EOF
fi

echo "[Locale] en_US as main language with Belgian numeric/time formats configured."

