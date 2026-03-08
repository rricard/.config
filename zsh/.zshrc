#!/usr/bin/env zsh

# Ensure emacs-style line editing (Ctrl+A/E etc.)
bindkey -e

# ZSH-specific: completions
autoload -Uz compinit && compinit

# ZSH-specific: Prompt init (vendored)
fpath+=("$XDG_CONFIG_HOME/zsh/vendored/pure")
autoload -U promptinit; promptinit
prompt pure

# ZSH-specific: Syntax highlight init (vendored)
# shellcheck disable=SC1091
source "$XDG_CONFIG_HOME/zsh/vendored/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# fzf shell integration
if command -v fzf > /dev/null; then
  eval "$(fzf --zsh)"
fi

# Load run_commands from the bash config
# shellcheck disable=SC1091
. "$XDG_CONFIG_HOME/bash/run_commands.sh"

