" .vimrc file for ubuntu
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
set mouse=a
set laststatus=2
set statusline=%F%m%r%h%w\ (%Y)\ %=\ (%l/%L)\ [%p%%]
set shortmess+=I         " hide welcome message
set backupdir=/tmp       " put backups out of the way
set history=500
syntax on
filetype plugin indent on

" Global editing settings -------------------------------------------
set autoindent smartindent
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=eol,start,indent

" Key bindings ---------------------------------------------------------

" shift-left/right to switch between tabs
" need explicit keybindings in order to work with screen/tmux
nmap <silent> [1;2C :tabnext<CR>
nmap <silent> [1;2D :tabprev<CR>

nmap <silent> d[ :diffget 1<CR>
nmap <silent> d] :diffget 3<CR>

" F5 to view files in bufexplorer
map <silent> <unique> <F5> :BufExplorerHorizontalSplit<CR>

" Plugins --------------------------------------------------------------

" BufExplorer
let g:bufExplorerDefaultHelp = 0
let g:bufExplorerSplitBelow = 1
let g:bufExplorerOpenMode = 0
let g:bufExplorerSplitSize = 15

" Doxygen 
let g:load_doxygen_syntax=1

" netrw handler for opening html links
fun! s:NFH_html(pagefile)
    if executable("chromium-browser")
        let page = substitute(a:pagefile,'^','file://','')
        exe "!chromium-browser ".shellescape(page,1)
    else
        return 0
    endif
    return 1
endfun

" GUI settings ------------------------------------------------------
if $TERM == "linux"
    " For a linux console, disable CSApprox
    let g:CSApprox_loaded=1
else
    set t_Co=256
endif
colorscheme wombat
