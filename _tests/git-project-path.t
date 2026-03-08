Ensure git-project-path is on PATH:

  $ export PATH="$TESTDIR/../bin:$PATH"

Argument parsing — simple repo name (all defaults):

  $ GIT_PROJECT_PATH_BASE_DIR=base USER=alice git-project-path -n myrepo
  base/github.com/alice/myrepo/main

Argument parsing — user/repo (override user, keep default domain and branch):

  $ GIT_PROJECT_PATH_BASE_DIR=base USER=alice git-project-path -n bob/myrepo
  base/github.com/bob/myrepo/main

Argument parsing — domain/user/repo (explicit domain):

  $ GIT_PROJECT_PATH_BASE_DIR=base USER=alice git-project-path -n gitlab.com/bob/myrepo
  base/gitlab.com/bob/myrepo/main

Argument parsing — repo:branch (override branch):

  $ GIT_PROJECT_PATH_BASE_DIR=base USER=alice git-project-path -n myrepo:dev
  base/github.com/alice/myrepo/dev

Argument parsing — user/repo:branch:

  $ GIT_PROJECT_PATH_BASE_DIR=base USER=alice git-project-path -n bob/myrepo:dev
  base/github.com/bob/myrepo/dev

Argument parsing — domain/user/repo:branch:

  $ GIT_PROJECT_PATH_BASE_DIR=base USER=alice git-project-path -n gitlab.com/bob/myrepo:dev
  base/gitlab.com/bob/myrepo/dev

GIT_PROJECT_PATH_BASE_DIR defaults to $HOME/src when unset:

  $ USER=alice HOME=/fakehome git-project-path -n myrepo
  /fakehome/src/github.com/alice/myrepo/main

Integration — clones a local repo and creates a worktree:

  $ git -c init.defaultBranch=main init --quiet remote
  $ git -C remote commit --allow-empty --quiet -m "initial"
  $ GIT_PROJECT_PATH_BASE_DIR=base GIT_PROJECT_PATH_REMOTE="$(pwd)/remote" USER=alice git-project-path alice/myrepo
  base/github.com/alice/myrepo/main
  $ test -d base/github.com/alice/myrepo/.bare
  $ test -d base/github.com/alice/myrepo/main

Integration — reuses existing worktree without re-cloning:

  $ GIT_PROJECT_PATH_BASE_DIR=base GIT_PROJECT_PATH_REMOTE="$(pwd)/remote" USER=alice git-project-path alice/myrepo
  base/github.com/alice/myrepo/main

Integration — creates a new worktree for a branch that exists in the remote:

  $ git -C remote checkout --quiet -b feat
  $ git -C remote commit --allow-empty --quiet -m "feature"
  $ git -C remote checkout --quiet main
  $ GIT_PROJECT_PATH_BASE_DIR=base GIT_PROJECT_PATH_REMOTE="$(pwd)/remote" USER=alice git-project-path alice/myrepo:feat
  base/github.com/alice/myrepo/feat
  $ test -d base/github.com/alice/myrepo/feat

Integration — prompts when branch does not exist on remote, user confirms (y):

  $ echo y | GIT_PROJECT_PATH_BASE_DIR=base GIT_PROJECT_PATH_REMOTE="$(pwd)/remote" USER=alice git-project-path alice/myrepo:ghost
  Branch 'ghost' not found on origin. Create new local branch? yN base/github.com/alice/myrepo/ghost
  $ test -d base/github.com/alice/myrepo/ghost

Integration — prompts when branch does not exist on remote, user declines (N):

  $ echo n | GIT_PROJECT_PATH_BASE_DIR=base GIT_PROJECT_PATH_REMOTE="$(pwd)/remote" USER=alice git-project-path alice/myrepo:ghost2
  Branch 'ghost2' not found on origin. Create new local branch? yN Aborted.
  [1]
