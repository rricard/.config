#!/bin/sh
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
VENDORING_ROOT="${VENDORING_ROOT:-$(cd "$SCRIPT_DIR/.." && pwd)}"
PACKAGES="${1:-$SCRIPT_DIR/packages.txt}"

while read -r target url; do
  case "$target" in '#'*|'') continue ;; esac
  echo "Vendoring $target from $url..."
  dest="$VENDORING_ROOT/$target"
  rm -rf "$dest"
  mkdir -p "$(dirname "$dest")"
  tmpdir=$(mktemp -d)
  curl -fsSL "$url" | tar -xz -C "$tmpdir"
  extracted=$(find "$tmpdir" -mindepth 1 -maxdepth 1 -type d | head -1)
  mv "$extracted" "$dest"
  rm -rf "$tmpdir"
done < "$PACKAGES"
