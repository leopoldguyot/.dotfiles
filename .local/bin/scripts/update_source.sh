#!/usr/bin/env bash
#
# Update and rebuild all tools from source
#

set -euo pipefail

GH_SRC_DIR="${GH_SRC_DIR:-$HOME/.local/src}"
LOCAL_BIN="${LOCAL_BIN:-$HOME/.local/bin}"
CONFIG_FILE="${CONFIG_FILE:-$HOME/.config/source-tools.conf}"

mkdir -p "$GH_SRC_DIR" "$LOCAL_BIN"

while IFS='|' read -r name repo build_cmd; do
    [ -z "$name" ] && continue
    dest="$GH_SRC_DIR/$name"
    echo "🔄 Updating $name..."
    if [ ! -d "$dest/.git" ]; then
        echo "📦 Cloning $name..."
        git clone --depth=1 "$repo" "$dest"
    else
        git -C "$dest" pull
    fi
    cd "$dest"
    echo "⚙️ Rebuilding $name..."
    eval "$build_cmd"
    echo "✅ $name updated successfully."
done < "$CONFIG_FILE"

echo "🎉 All source tools updated."

