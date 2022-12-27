# `.config`

A set of config files which happens to work for me. It is essentially an `XDG_CONFIG_HOME`.

I wouldn't recommend using it just like that: read it, understand it and then steal from it for your own `.config`...

## Prereqs

- Install Git & Neovim otherwise you will end up in a broken state
- Install zsh and chsh to it on Linux if you want to pick up this config, bash is left untouched

## Installation

Dependencies are vendored and audited so no need to install them after a checkout.

### Windows

- Set `XDG_CONFIG_HOME` to the location of this directory in your User Environment Variables
- Copy [_install/Microsoft.PowerShell_profile.ps1] to the locations listed in the file

### Linux/macOS

- Copy [_install/.zshrc] to your home directory, adjust the `XDG_CONFIG_HOME` variable in there if needed

## Extension points

All files containing `nosync` in their names are gitiginored so you can reasonably extend things for a local environment without syncing to git.

Notably, you can create new `.csv` files in:

- `_aliases` to setup new command aliases in both ZSH and Powershell
- `_env` to setup env variables in both ZSH and Powershell
