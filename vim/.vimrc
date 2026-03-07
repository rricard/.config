" Looks
syntax enable
colorscheme wildcharm
highlight Normal ctermbg=NONE guibg=NONE
set number relativenumber
set showcmd " keeps last command entered
set cursorline
set wildmenu " autocomplete in command menu
set lazyredraw
set showmatch
set listchars=tab:>·,space:·
set list
set colorcolumn=80,100,120

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
" Auto-reload files changed outside vim (when buffer is unmodified)
set autoread
autocmd FocusGained,BufEnter * checktime

" In-file Search
set incsearch " search as you type
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" Shell exec - use wrapper to get aliases without interactive exec
set shell=$XDG_CONFIG_HOME/vim/vim-shell
set shellcmdflag=-c

" FZF
" linux fzf already on the rtp
set rtp+=/opt/homebrew/opt/fzf " macOS
set rtp+=~/.config/vim/vendor/fzf.vim

" Keybindings
nmap <C-P> :FZF<CR>
nmap <C-G> :RG<CR>
