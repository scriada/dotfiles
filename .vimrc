" .vimrc file for ubuntu
" Author: Adam Scriven
" Last Modified: 24th December 2009

" Operational settings ------------------------------------------------
"
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
set wildmode=longest,list,full
set wildmenu        " make menu more intuitive
set incsearch       " incremental search
set scrolloff=5     " minimum number of lines to keep above below cursor
set sidescrolloff=5 " minimum number of columns to keep the the side of the cursor
set mouse=a         " enable mouse
set shortmess+=I    " hide welcome message
set history=500     " more history
set laststatus=2    " always display status menu
set statusline=%f%m%r%h%w\ (%Y)\ %=\ (%l/%L)\ [%p%%]
set timeoutlen=1000 ttimeoutlen=0 " avoid delay in ESC key
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
set nojoinspaces     " when joining lines, don't put 2 spaces after a full stop.


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

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'scrooloose/syntastic'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
" colour schemes
Plugin 'sheerun/vim-wombat-scheme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
"Plugin 'godlygeek/csapprox'

" Misc
Plugin 'vim-scripts/QuickBuf'
call vundle#end()
filetype plugin indent on

let g:ultisnips_python_style="numpy"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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

let g:EasyMotion_leader_key = '<Leader>'

let g:flake8_show_in_file=1  " show
let g:flake8_show_in_gutter=0  " show
let g:flake8_show_quickfix=0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['jshint']

let g:jedi#popup_on_dot = 0

" GUI settings ------------------------------------------------------

if $COLORTERM == "gnome-terminal"
    set t_Co=256 " gnome terminal is color compatible
elseif $TERM == "linux" || $TERM == "screen"
    let g:CSApprox_loaded=1 " For a linux console, disable CSApprox
endif

set ttyfast
set lazyredraw

colorscheme wombat

"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"set background=dark
"colorscheme solarized

"set background=dark
"let base16colorspace=256
"colorscheme base16-solarized
