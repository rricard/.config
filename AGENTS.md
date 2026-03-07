# AGENTS.md

This file provides guidance to Claude Code (claude.ai/code) and other agents when working with code in this repository.

## Overview

This is a personal XDG_CONFIG_HOME (`~/.config`) dotfiles repository. It provides cross-platform shell and editor configuration for Linux/macOS (zsh) and Windows (PowerShell). Dependencies are vendored — no package manager installation needed after checkout.

## Architecture

### Cross-platform extension points

Two CSV-driven systems work identically in both zsh (`zsh/.zshrc`) and PowerShell (`powershell/Profile.ps1`):

- **`_env/*.csv`** — environment variables. Each row: `action,name,value` where action is `set`, `append`, or `prepend`.
- **`_aliases/*.csv`** — shell aliases. Each row: `name,command`.

To add env vars or aliases that apply on both platforms, add/edit these CSV files. Files with `nosync` anywhere in their name are gitignored and meant for local-only customization.

### Neovim config (`nvim/`)

- `vimrc` — classic Vimscript config, loaded first (works in plain vim too)
- `init.lua` — entry point: sources `vimrc`, then loads `lua/lsp.lua` and `lua/autoformat.lua`
- `lua/lsp.lua` — enables LSP servers (luals, ocamllsp) via `vim.lsp.enable()`
- `lua/autoformat.lua` — auto-formats on save: LSP format for Lua, `ocamlformat` (via opam) for OCaml
- `lsp/` — per-LSP config files loaded automatically by name
- `vendor/fzf.vim-*/` — vendored fzf.vim plugin

New LSP servers: add a config file in `nvim/lsp/<servername>.lua` and call `vim.lsp.enable('<servername>')` in `lua/lsp.lua`.

### ZSH config (`zsh/`)

`zsh/.zshrc` is the actual zshrc (symlinked/sourced from `~/.zshrc`). It loads vendored pure prompt and zsh-syntax-highlighting, then processes `_env/` and `_aliases/` CSVs, then initializes Homebrew (macOS arm64) and opam (OCaml) if present.

### Installation

- **Linux/macOS**: Copy `_install/.zshrc` to `~/.zshrc` (sets `XDG_CONFIG_HOME` and sources `zsh/.zshrc`)
- **Windows**: Copy `_install/Microsoft.PowerShell_profile.ps1` to the PowerShell profile locations listed in that file; set `XDG_CONFIG_HOME` in User Environment Variables
