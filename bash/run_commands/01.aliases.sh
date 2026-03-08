#!/usr/bin/env sh

# Editor
if command -v nvim > /dev/null; then
  alias vim=nvim
fi

# Git
alias 'g?'='git status -sb'
alias 'g+'='git add --all'
alias 'g-'='git rm'
alias gc='git commit -a -m'
alias gsy='git pull;git push'
alias gck='git checkout'
