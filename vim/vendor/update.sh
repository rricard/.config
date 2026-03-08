#!/bin/sh
set -e

VENDOR_DIR="$(cd "$(dirname "$0")" && pwd)"

update_plugin() {
  local name="$1"
  local url="$2"

  echo "Cloning $name..."
  rm -rf "$VENDOR_DIR/$name"
  git clone "$url" "$VENDOR_DIR/$name"
  rev=$(git -C "$VENDOR_DIR/$name" rev-parse HEAD)
  rm -rf "$VENDOR_DIR/$name/.git"
  printf '%s %s %s\n' "$name" "$url" "$rev" >> "$VENDOR_DIR/versions.txt.tmp"
}

: > "$VENDOR_DIR/versions.txt.tmp"
update_plugin fzf.vim https://github.com/junegunn/fzf.vim
mv "$VENDOR_DIR/versions.txt.tmp" "$VENDOR_DIR/versions.txt"
