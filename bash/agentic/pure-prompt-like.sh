#!/usr/bin/env bash

# A rough reproduction of pure-prompt for bash using claude-code.
# This is not a 1-1 repro but gets us most of the way there if we do not have zsh around

_prompt_git_branch() {
  git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null
}

_prompt_git_dirty() {
  test -z "$(git status --porcelain 2>/dev/null)" || printf '*'
}

_prompt_build() {
  local exit_code=$?

  # Non-printing wrappers for color codes (required when setting PS1 programmatically)
  local rl=$'\001' rr=$'\002'
  local reset blue gray pink magenta red
  reset="${rl}$(printf '\e[0m')${rr}"
  blue="${rl}$(printf '\e[34m')${rr}"
  gray="${rl}$(printf '\e[38;5;242m')${rr}"
  pink="${rl}$(printf '\e[38;5;218m')${rr}"
  magenta="${rl}$(printf '\e[35m')${rr}"
  red="${rl}$(printf '\e[31m')${rr}"

  local preprompt="${blue}\w${reset}"
  local branch
  branch=$(_prompt_git_branch)
  if [ -n "$branch" ]; then
    local dirty
    dirty=$(_prompt_git_dirty)
    preprompt="${preprompt} ${gray}${branch}${reset}${pink}${dirty}${reset}"
  fi

  local symbol_color
  if [ "$exit_code" -eq 0 ]; then
    symbol_color="$magenta"
  else
    symbol_color="$red"
  fi

  PS1="\n${preprompt}\n${symbol_color}❯${reset} "
}

PROMPT_COMMAND=_prompt_build
