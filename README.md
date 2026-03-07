# `.config`

A set of config files which happens to work for me. It is essentially an `XDG_CONFIG_HOME`.

I wouldn't recommend using it just like that: read it, understand it and then steal from it for your own `.config`...

## Prereqs

- Install Git, Fzf & Neovim otherwise you will end up in a broken state
- Install zsh and chsh for a better experience but bash should work relatively okay

## Installation

Dependencies are vendored and audited so no need to install them after a checkout.

You need to copy some base config files into your homedir to get started:

```bash
cp _install/.* $HOME/
```

## Useful keybindings

Most of those come as defaults from the way the tools were installed.

### Shell shortcuts

| Shortcut | Action |
|----------|--------|
| `Ctrl+R` | Fuzzy search shell history |
| `Ctrl+T` | Fuzzy search files and insert path at cursor |
| `Alt+C`  | Fuzzy search directories and cd into selection |

