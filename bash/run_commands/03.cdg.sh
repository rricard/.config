#!/usr/bin/env bash

# cdg — cd into a git worktree, cloning and creating it as needed.
# Wraps git-project-path which resolves (and sets up) the path.
# With no arguments, opens fzf to pick from known repos/worktrees.
cdg() {
  if [[ $# -eq 0 ]]; then
    local base="${GIT_PROJECT_PATH_BASE_DIR:-$HOME/src}"
    local candidates=()
    local d repo b bname

    for d in "$base"/*/*/*/.bare; do
      [[ -d "$d" ]] || continue
      repo="${d#"$base"/}"
      repo="${repo%/.bare}"
      candidates+=("$repo")
      for b in "${d%/.bare}"/*/; do
        bname="${b%/}"
        bname="${bname##*/}"
        [[ "$bname" == ".bare" ]] && continue
        candidates+=("$repo:$bname")
      done
    done

    local sel
    sel=$(printf '%s\n' "${candidates[@]}" | fzf) || return
    set -- "$sel"
  fi

  local d
  d=$(git-project-path "$@") && cd "$d" || return
}
