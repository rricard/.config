#!/usr/bin/env bash

# A rough reproduction of pure-prompt for bash using claude-code.
# This is not a 1-1 repro but gets us most of the way there if we do not have zsh around

_prompt_git_branch() {
  git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null
}

_prompt_git_dirty() {
  test -z "$(git status --porcelain 2>/dev/null)" || printf '*'
}

_prompt_git_action() {
  local root
  root=$(git rev-parse --show-toplevel 2>/dev/null) || return
  if [ -f "$root/.git/MERGE_HEAD" ]; then
    printf 'merge'
  elif [ -d "$root/.git/rebase-merge" ] || [ -d "$root/.git/rebase-apply" ]; then
    printf 'rebase'
  elif [ -f "$root/.git/CHERRY_PICK_HEAD" ]; then
    printf 'cherry-pick'
  elif [ -f "$root/.git/BISECT_LOG" ]; then
    printf 'bisect'
  fi
}

_prompt_hg_root() {
  hg root 2>/dev/null
}

_prompt_hg_branch() {
  # Prefer active bookmark (more like git branches); fall back to named branch
  local bookmark
  bookmark=$(hg log -r . --template '{activebookmark}' 2>/dev/null)
  if [ -n "$bookmark" ]; then
    printf '%s' "$bookmark"
  else
    hg branch 2>/dev/null
  fi
}

_prompt_hg_dirty() {
  test -z "$(hg status 2>/dev/null)" || printf '*'
}

_prompt_hg_action() {
  local root
  root=$(_prompt_hg_root) || return
  if [ -f "$root/.hg/merge/state" ] || [ -f "$root/.hg/merge/state2" ]; then
    printf 'merge'
  elif [ -f "$root/.hg/rebasestate" ]; then
    printf 'rebase'
  elif [ -f "$root/.hg/histedit-state" ]; then
    printf 'histedit'
  elif [ -f "$root/.hg/bisect.state" ]; then
    printf 'bisect'
  fi
}

_prompt_build() {
  local exit_code=$?

  # Non-printing wrappers for color codes (required when setting PS1 programmatically)
  local rl=$'\001' rr=$'\002'
  local reset blue gray pink magenta red yellow
  reset="${rl}$(printf '\e[0m')${rr}"
  blue="${rl}$(printf '\e[34m')${rr}"
  gray="${rl}$(printf '\e[38;5;242m')${rr}"
  pink="${rl}$(printf '\e[38;5;218m')${rr}"
  magenta="${rl}$(printf '\e[35m')${rr}"
  red="${rl}$(printf '\e[31m')${rr}"
  yellow="${rl}$(printf '\e[33m')${rr}"

  local preprompt="${blue}\w${reset}"
  local branch dirty action

  branch=$(_prompt_git_branch)
  if [ -n "$branch" ]; then
    dirty=$(_prompt_git_dirty)
    action=$(_prompt_git_action)
    preprompt="${preprompt} ${gray}${branch}${reset}${pink}${dirty}${reset}"
    [ -n "$action" ] && preprompt="${preprompt} ${yellow}${action}${reset}"
  elif _prompt_hg_root > /dev/null 2>&1; then
    branch=$(_prompt_hg_branch)
    dirty=$(_prompt_hg_dirty)
    action=$(_prompt_hg_action)
    [ -n "$branch" ] && preprompt="${preprompt} ${gray}${branch}${reset}${pink}${dirty}${reset}"
    [ -n "$action" ] && preprompt="${preprompt} ${yellow}${action}${reset}"
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
