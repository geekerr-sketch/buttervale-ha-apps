#!/bin/sh
set -eu

ZIM_DIR="/share/kiwix"

echo "Starting Buttervale Kiwix Server..."
echo "Looking for ZIM files in $ZIM_DIR"

if [ ! -d "$ZIM_DIR" ]; then
    echo "ERROR: ZIM directory not found."
    exit 1
fi

set -- "$ZIM_DIR"/*.zim

if [ ! -f "$1" ]; then
    echo "ERROR: No ZIM files found in $ZIM_DIR"
    exit 1
fi

exec kiwix-serve --port=8080 "$@"
