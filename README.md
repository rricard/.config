# `.config`

A set of config files which happens to work for me. It is essentially an `XDG_CONFIG_HOME`.

I wouldn't recommend using it just like that: read it, understand it and then steal from it for your own `.config`...

## Prereqs

In theory, bash and vim are the only requirement for this to be useful.

This config will gracefully improve with:
- git
- fzf
- neovim

## Installation

Dependencies are vendored and audited so no need to install them after a checkout.

You need to copy some base config files into your homedir to get started:

```bash
cp _install/.* $HOME/
```

## Useful keybindings


### Shell shortcuts

| Shortcut | Action | Configured in |
|----------|--------|---------------|
| `Ctrl+R` | Fuzzy search shell history | _Default_ |
| `Ctrl+T` | Fuzzy search files and insert path at cursor | _Default_ |
| `Alt+C`  | Fuzzy search directories and cd into selection | _Default_ |

### Vim/Nvim shortcuts

| Shortcut | Action | Configured in |
|----------|--------|---------------|
| `Ctrl+P` | Fuzzy find files | `vim/.vimrc` |
| `Ctrl+G` | Fuzzy grep files | `vim/.vimrc` |
