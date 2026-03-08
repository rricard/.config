local opam_bin = vim.fn.trim(vim.fn.system('opam var bin'))
local ocamllsp_bin = opam_bin .. "/ocamllsp"

return {
  cmd = {ocamllsp_bin},
  filetypes = { 'ocaml', 'menhir', 'ocamlinterface', 'ocamllex', 'reason', 'dune' },
  root_markers = { 'dune-project', 'dune', '.git' },
}

