-- loads up the "universal" config loadable in classic vim
vim.cmd('source ~/.config/nvim/vimrc')

-- LSPs
vim.lsp.enable('luals')
vim.lsp.enable('ocamllsp')

-- Autoformat
vim.api.nvim_create_augroup('AutoFormatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.lua',
  group = 'AutoFormatting',
  callback = function()
    vim.lsp.buf.format()
  end,
})

local opam_bin = vim.fn.trim(vim.fn.system('opam var bin'))
local ocamllformat_bin = opam_bin .. "/ocamlformat"
vim.api.nvim_create_autocmd(
  "BufWritePost",
  {
    pattern = "*.ml,*.mli,dune",
    group = "AutoFormatting",
    callback = function()
      vim.cmd(" silent !" .. ocamllformat_bin .. " -i %")
      vim.cmd("edit")
    end,
  }
)
