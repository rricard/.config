# INTERNALS.md

This file provides guidance for humans, Claude Code (claude.ai/code) and other agents when working with code in this repository.

## Overview

This is a personal XDG_CONFIG_HOME (`~/.config`) dotfiles repository for Linux/macOS (zsh). Dependencies are vendored — no package manager installation needed after checkout.

## Architecture

### Shell extension points

- **`sh/profile/*.sh`** — environment variables
- **`bash/run_commands/*.sh`** — interactive commands, variables and aliases
- **`bash/.bashrc`** — specific bash run commands
- **`zsh/.zshrc`** — specific zsh run commands

Files with `nosync` anywhere in their name are gitignored and meant for local-only customization.

### Editor config (`vim/` & `nvim/`)

- `vim/.vimrc` — classic Vimscript config, loaded first (works in plain vim too)
- `vim/vendor/fzf.vim-*/` — vendored fzf.vim plugin
- `nvim/init.lua` — entry point: sources `vimrc`, then loads `nvim/lua/lsp.lua` and `lua/autoformat.lua`
- `nvim/lua/lsp.lua` — enables LSP servers (luals, ocamllsp) via `vim.lsp.enable()`
- `nvim/lua/autoformat.lua` — auto-formats on save: LSP format for Lua, `ocamlformat` (via opam) for OCaml
- `nvim/lsp/` — per-LSP config files loaded automatically by name

New LSP servers: add a config file in `nvim/lsp/<servername>.lua` and call `vim.lsp.enable('<servername>')` in `nvim/lua/lsp.lua`.

### Shell configs (`sh/`, `bash/` & `zsh/`)

- `sh/.profile` is the login profile that gets loaded regardless of the shell. 
  - It sequentially sources files in `sh/profile/`.
- `bash/.bashrc` is exclusively loaded by bash interactive shells.
  - It sequentially sources files in `bash/run_commands/`.
  - It can do bash-specific initialization (e.g. prompt styling)
- `zsh/.zshrc` is exclusively loaded by zsh interactive shells.
  - It sequentially sources files in `bash/run_commands/`.
  - It loads zsh-specific initialization, mostly from vendored packages
    (e.g. prompt styling & syntax highlighting)

### Installation

Installation is made by copying profile files from `_install` to the home directory.

Those files are responsible for setting up `XDG_CONFIG_HOME` and sourcing the respective profiles and rcs.

All dependencies being vendored mean that no other commands are required. No remote dependency can be added here, all the code that can be executed is checked into the repo.

Minimal installed programs assumed:
- bash
- vim

Expected installed programs:
- zsh
- nvim
- fzf
- git
