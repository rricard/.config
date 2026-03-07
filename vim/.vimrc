" Looks
syntax enable
set number relativenumber
set showcmd " keeps last command entered
set cursorline
set wildmenu " autocomplete in command menu
set lazyredraw
set showmatch
set listchars=tab:>·,space:·
set list

" Edition
set tabstop=2
set shiftwidth=0 " defaults to tabstop
set softtabstop=4
set expandtab " tab = spaces
filetype indent on

" Key bindings
let mapleader=","

" File saving options
set ff=unix

" In-file Search
set incsearch " search as you type
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" Shell exec
set shellcmdflag=-ic

" FZF
" linux fzf already on the rtp
set rtp+=/opt/homebrew/opt/fzf " macOS
set rtp+=~/.config/vim/vendor/fzf.vim-3725f364ccd25b85a91970720ba9bc2931861910

" Keybindings
nmap <C-P> :GFiles<CR>
nmap <C-R> :RG<CR>
