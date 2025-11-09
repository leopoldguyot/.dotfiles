#!/usr/bin/env bash
#
# Install a single GitHub repository from source
# Usage:
#   install_from_source <name>
#

set -euo pipefail

GH_SRC_DIR="${GH_SRC_DIR:-$HOME/.local/src}"
LOCAL_BIN="${LOCAL_BIN:-$HOME/.local/bin}"
CONFIG_FILE="${CONFIG_FILE:-$HOME/.config/source-tools.conf}"

mkdir -p "$GH_SRC_DIR" "$LOCAL_BIN"

if [ $# -lt 1 ]; then
    echo "Usage: $0 <tool_name>"
    exit 1
fi

TOOL_NAME="$1"

while IFS='|' read -r name repo build_cmd; do
    [ -z "$name" ] && continue
    if [ "$name" == "$TOOL_NAME" ]; then
        dest="$GH_SRC_DIR/$name"
        echo "🚧 Installing $name from $repo..."
        if [ -d "$dest/.git" ]; then
            echo "🔄 Updating existing $name..."
            git -C "$dest" pull
        else
            git clone --depth=1 "$repo" "$dest"
        fi
        cd "$dest"
        echo "⚙️ Building $name..."
        eval "$build_cmd"
        echo "✅ $name installed successfully."
        exit 0
    fi
done < "$CONFIG_FILE"

echo "❌ Tool $TOOL_NAME not found in config ($CONFIG_FILE)"
exit 1

