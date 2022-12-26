" Looks
syntax enable
set number
set showcmd " keeps last command entered
" set cursorline
set wildmenu " autocomplete in command menu
set lazyredraw
set showmatch
set listchars=tab:>·,space:·
set list

" Edition
set tabstop=4
set shiftwidth=0 " defaults to tabstop
set softtabstop=4
" set expandtab " tab = spaces
filetype indent on

" Key bindings
let mapleader=","

" File saving options
set ff=unix

" Search
set incsearch " search as you type
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" Language: OCaml
autocmd FileType ocaml setlocal shiftwidth=2 softtabstop=2 expandtab
set rtp^=$HOME/.opam/default/share/ocp-indent/vim"
