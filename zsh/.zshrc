#!/usr/bin/env zsh

# Load run_commands from the bash config
. $XDG_CONFIG_HOME/bash/run_commands.sh

# Ensure emacs-style line editing (Ctrl+A/E etc.)
bindkey -e

# ZSH-specific: Prompt init (vendored)
fpath+=("$XDG_CONFIG_HOME/zsh/vendored/pure")
autoload -U promptinit; promptinit
prompt pure

# ZSH-specific: Syntax highlight init (vendored)
source "$XDG_CONFIG_HOME/zsh/vendored/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# fzf shell integration
if command -v fzf > /dev/null; then
  eval "$(fzf --zsh)"
fi
