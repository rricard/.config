# AGENTS.md

This file provides guidance to Claude Code (claude.ai/code) and other agents when working with code in this repository.

## Overview

This is a personal XDG_CONFIG_HOME (`~/.config`) dotfiles repository for Linux/macOS (zsh). Dependencies are vendored — no package manager installation needed after checkout.

## Architecture

### Extension points

- **`_env/*.sh`** — sourced to set environment variables
- **`_aliases/*.sh`** — sourced to define shell aliases

Files with `nosync` anywhere in their name are gitignored and meant for local-only customization.

### Neovim config (`nvim/`)

- `vimrc` — classic Vimscript config, loaded first (works in plain vim too)
- `init.lua` — entry point: sources `vimrc`, then loads `lua/lsp.lua` and `lua/autoformat.lua`
- `lua/lsp.lua` — enables LSP servers (luals, ocamllsp) via `vim.lsp.enable()`
- `lua/autoformat.lua` — auto-formats on save: LSP format for Lua, `ocamlformat` (via opam) for OCaml
- `lsp/` — per-LSP config files loaded automatically by name
- `vendor/fzf.vim-*/` — vendored fzf.vim plugin

New LSP servers: add a config file in `nvim/lsp/<servername>.lua` and call `vim.lsp.enable('<servername>')` in `lua/lsp.lua`.

### ZSH config (`zsh/`)

`zsh/.zshrc` is the actual zshrc (sourced from `~/.zshrc`). It loads vendored pure prompt and zsh-syntax-highlighting, sources all `_env/*.sh` and `_aliases/*.sh` files, then initializes Homebrew (macOS arm64) and opam (OCaml) if present.

### Installation

Copy `_install/.zshrc` to `~/.zshrc` (sets `XDG_CONFIG_HOME` and sources `zsh/.zshrc`).
