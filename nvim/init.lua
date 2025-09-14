-- loads up the "universal" config loadable in classic vim
vim.cmd('source ~/.config/nvim/vimrc')

-- LSPs
vim.lsp.enable('luals')
vim.lsp.enable('ocamllsp')

-- Autoformat on save
vim.api.nvim_create_augroup('AutoFormatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.lua',
  group = 'AutoFormatting',
  callback = function()
    vim.lsp.buf.format()
  end,
})

local opam_bin = vim.fn.trim(vim.fn.system('opam var bin'))
local ocamlformat_bin = opam_bin .. "/ocamlformat"
vim.api.nvim_create_autocmd(
  "BufWritePost",
  {
    -- Special case for OCaml files (ocammllsp doesn't format)
    pattern = "*.ml,*.mli",
    group = "AutoFormatting",
    callback = function()
      vim.cmd(" silent !" .. ocamlformat_bin .. " -i %")
      vim.cmd("edit")
    end,
  }
)
