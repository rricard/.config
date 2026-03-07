-- loads up the "universal" config loadable in classic vim
vim.cmd('source $XDG_CONFIG_HOME/nvim/.vimrc')

-- loads up nvim systems
require "lsp"
require "autoformat"
