#!/usr/bin/env sh

if command -v nvim > /dev/null; then
  export EDITOR=nvim
else
  export EDITOR=vim
fi
export PATH="$PATH:$HOME/.local/bin/:$XDG_CONFIG_HOME/bin/"


export GIT_PROJECT_PATH_BASE_DIR="$HOME/src"

