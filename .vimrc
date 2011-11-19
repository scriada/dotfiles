" .vimrc file for ubuntu
" Author: Adam Scriven
" Last Modified: 24th December 2009

" Operational settings ------------------------------------------------
set nocompatible
set hidden          " allow multiple buffers to be open
set hlsearch        " highlight searches
set ignorecase      " case insensitive search
set smartcase       " case sensitive if pattern contains upper-case
set number          " display line numbers
set smartcase       " ignore case if search pattern is all lowercase
set autoread        " detect when a file has been modified ourside of vim
set nobackup        " disable backup files
set noswapfile      " disable .swp files
set wildmenu        " make menu more intuitive
set incsearch       " incremental search
set scrolloff=5     " minimum number of lines to keep above below cursor
set sidescrolloff=5 " minimum number of columns to keep the the side of the cursor
set mouse=a         " enable mouse
set shortmess+=I    " hide welcome message
set history=500     " more history
set laststatus=2    " always display status menu
set statusline=%f%m%r%h%w\ (%Y)\ %=\ (%l/%L)\ [%p%%]
syntax on
filetype plugin indent on

if has("win32")
    set clipboard+=unnamed
endif

" Global editing settings -------------------------------------------
set autoindent       " automatically indent line
set expandtab        " by default expand tabs
set smarttab         " insert tabs on the start of a line according to shidtwidth, not tabstop
set tabstop=4        " set tab to 4 spaces
set shiftwidth=4     " number of space to use for auto-indenting
set backspace=eol,start,indent " allow backspacing over everything in insert mode

" Key bindings ---------------------------------------------------------

" make ; the same as : in normal mode - saves a few keystrokes!
nnoremap ; :

" Q = format
map Q gq

" clear highlighted searches
nmap <silent> ,/ :nohlsearch<CR>

" shift-left/right to switch between tabs
" need explicit keybindings in order to work with screen/tmux
nmap <silent> [1;2C :tabnext<CR>
nmap <silent> [1;2D :tabprev<CR>

" useful commands when merging in vimdiff
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
if $TERM == "linux" || $TERM == "screen"
    " For a linux console, disable CSApprox
    let g:CSApprox_loaded=1
endif
colorscheme wombat

" highlight trailing whitespace as an error
"au Syntax * syntax match Error /\s\+\%#\@<!$/ containedin=ALL
