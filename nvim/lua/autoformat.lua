vim.api.nvim_create_augroup('AutoFormatting', {})

-- General case: use LSP
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.lua',
  group = 'AutoFormatting',
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- OCaml: ocamllsp doesn't call ocamlformat (manual call)
local opam_bin = vim.fn.trim(vim.fn.system('opam var bin'))
local ocamlformat_bin = opam_bin .. "/ocamlformat"
vim.api.nvim_create_autocmd(
  "BufWritePost",
  {
    pattern = "*.ml,*.mli",
    group = "AutoFormatting",
    callback = function()
      vim.cmd(" silent !" .. ocamlformat_bin .. " -i %")
      vim.cmd("edit")
    end,
  }
)
