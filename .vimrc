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
if !has('nvim')
    set ttymouse=xterm2 " needed for tmux?
endif
set shortmess+=I    " hide welcome message
set history=500     " more history
set laststatus=2    " always display status menu
set clipboard=unnamedplus " use system clipboard
set statusline=%f%m%r%h%w\ (%Y)\ %=\ (%l/%L)\ [%p%%]
set timeoutlen=1000 ttimeoutlen=0 " avoid delay in ESC key
set listchars=trail:~,tab:->,eol:$,space:·
syntax on
filetype plugin indent on

if has("win32")
    set clipboard+=unnamed
endif

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
endif

" Global editing settings -------------------------------------------
set autoindent       " automatically indent line
set expandtab        " by default expand tabs
set smarttab         " insert tabs on the start of a line according to shidtwidth, not tabstop
set tabstop=4        " set tab to 4 spaces
set shiftwidth=4     " number of space to use for auto-indenting
set backspace=eol,start,indent " allow backspacing over everything in insert mode
set nojoinspaces     " when joining lines, don't put 2 spaces after a full stop.
set noeol


" Key bindings ---------------------------------------------------------

" make ; the same as : in normal mode - saves a few keystrokes!
nnoremap ; :

" Q = format
map Q gq

" disable F1 key, as I often press this my mistake
nmap <F1> <nop>

" clear highlighted searches
nmap <silent> ,/ :nohlsearch<CR>

" shift-left/right to switch between tabs
" need explicit keybindings in order to work with screen/tmux
if has('nvim')
    nmap <silent> <S-Right> :tabnext<CR>
    nmap <silent> <S-Left> :tabprev<CR>
else
   nmap <silent> [1;2C :tabnext<CR>
   nmap <silent> [1;2D :tabprev<CR>
endif

" useful commands when merging in vimdiff
nmap <silent> d[ :diffget 1<CR>
nmap <silent> d] :diffget 3<CR>

" Ctrl-# to search for search under cursor
" (was Ctrl-] but clasahed with tags)
nmap <silent> <C-t> :Ag <cword> <CR>

" Navigate popup using Ctrl-j and Ctrl-k
inoremap <expr><C-j> pumvisible()? "\<C-n>" : "\<Down>"
inoremap <expr><C-k> pumvisible()? "\<C-p>" : "\<Up>"

" F5 to view files in bufexplorer
map <silent> <unique> <F5> :BufExplorerHorizontalSplit<CR>
nnoremap <F5> "=strftime("%c")<CR>P

" Plugins --------------------------------------------------------------
if has('nvim')
    call plug#begin('~/.config/nvim/plugged')
    source ~/.config/nvim/plugins.vim
    call plug#end()
else
    call plug#begin('~/.vim/bundle')
    source ~/.vim/plugins.vim
    let inform_highlight_glulx=1
    call plug#end()
endif

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
set ttyfast
set lazyredraw

if has('nvim')
    colorscheme material-oceanic
else
    if $COLORTERM == "gnome-terminal" || $COLORTERM == "truecolor"
        set t_Co=256 " gnome terminal is color compatible
    endif
    if $JUPYTER_SERVER_ROOT != ""
        colorscheme molokai
    elseif filereadable(expand("~/.vimrc_background"))
        let base16colorspace=256
        source ~/.vimrc_background
    else
        colorscheme wombat
    endif
endif

hi SpellBad cterm=underline ctermfg=black
