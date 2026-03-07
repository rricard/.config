#!/usr/bin/env sh

if command -v nvim > /dev/null; then
  export EDITOR=nvim
else
  export EDITOR=vim
fi
export PATH="$PATH:$HOME/.local/bin"
