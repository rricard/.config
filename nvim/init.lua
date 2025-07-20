-- loads up the "universal" config loadable in classic vim
vim.cmd('source ~/.config/nvim/vimrc')

-- initialize plugins via lazy.nvim
require('plugins')

-- nvim-dependent configs
vim.cmd.colorscheme "catppuccin-latte"

