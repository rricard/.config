#!/usr/bin/env bash

# Run commands
# shellcheck disable=SC1090
. "$XDG_CONFIG_HOME/bash/run_commands.sh"

# Prompt styling
# shellcheck disable=SC1090
. "$XDG_CONFIG_HOME/bash/agentic/pure-prompt-like.sh"

# fzf shell integration
if command -v fzf > /dev/null; then
  eval "$(fzf --bash)"
fi