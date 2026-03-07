# `.config`

A set of config files which happens to work for me. It is essentially an `XDG_CONFIG_HOME`.

I wouldn't recommend using it just like that: read it, understand it and then steal from it for your own `.config`...

## Prereqs

- Install Git & Neovim otherwise you will end up in a broken state
- Install zsh and chsh to it on Linux if you want to pick up this config, bash is left untouched

## Installation

Dependencies are vendored and audited so no need to install them after a checkout.

- Copy [_install/.zshrc] to your home directory, adjust the `XDG_CONFIG_HOME` variable in there if needed

## Extension points

All files containing `nosync` in their names are gitignored so you can reasonably extend things for a local environment without syncing to git.

Notably, you can create new `.sh` files in:

- `_aliases` to add shell aliases
- `_env` to set environment variables
