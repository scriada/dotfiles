" File: .vimrc
" Author: Adam Scriven
" Last Modified: 24th December 2009

" Operational settings ------------------------------------------------
set nocompatible
set hidden
set more
set hlsearch
set ignorecase
set number
set smartcase
set autoread
set backup
set wildmenu
set incsearch
set scrolloff=5
set sidescrolloff=5
set history=500
set mouse=a
set shortmess+=I         " hide welcome message
set backupdir=/tmp       " put backups out of the way
set laststatus=2
set statusline=%F%m%r%h%w\ (%Y)\ %=\ (%l/%L)\ [%p%%]
syntax on
filetype plugin indent on


" Key bindings ---------------------------------------------------------

" Ctrl+left/right for prev/next tab
" need explicit keybindings in order to work with screen/tmux
nmap <silent> [1;2C :tabnext<CR>
nmap <silent> [1;2D :tabprev<CR>

map <silent> <F5> :BufExplorerHorizontalSplit<CR>

" Plugins --------------------------------------------------------------

" BufExplorer
let g:bufExplorerDefaultHelp = 0
let g:bufExplorerSplitBelow = 1
let g:bufExplorerOpenMode = 0
let g:bufExplorerSplitSize = 15

" Doxygen 
let g:load_doxygen_syntax=1

" Global editing settings -------------------------------------------
set autoindent smartindent
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=eol,start,indent

" GUI settings ------------------------------------------------------
if $TERM == "linux"
    " For a linux console, disable CSApprox
    let g:CSApprox_loaded=1
else
    set t_Co=256
endif
colorscheme desert
highlight LineNr guibg=#1E1D1D
