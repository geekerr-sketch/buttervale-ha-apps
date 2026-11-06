#!/bin/sh
set -eu

ZIM_DIR="/share/kiwix"
mkdir -p /tmp/kiwix

echo "Starting Buttervale Kiwix Server..."

if [ ! -d "$ZIM_DIR" ]; then
    echo "ZIM directory not found: $ZIM_DIR"
    exit 1
fi

set -- "$ZIM_DIR"/*.zim

if [ ! -f "$1" ]; then
    echo "No ZIM files found in $ZIM_DIR"
    exit 1
fi

exec kiwix-serve --port=8080 "$@"
