-- loads up the "universal" config loadable in classic vim
vim.cmd('source $XDG_CONFIG_HOME/vim/.vimrc')

-- loads up nvim systems
require "lsp"
require "autoformat"
