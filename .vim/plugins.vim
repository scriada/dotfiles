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
Plugin 'janko-m/vim-test'

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

let g:EasyMotion_leader_key = '<Leader>'

let g:flake8_show_in_file=1  " show
let g:flake8_show_in_gutter=0  " show
let g:flake8_show_quickfix=0
let g:syntastic_python_checkers = ['flake8', 'pyflakes']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:jedi#force_py_version = 3
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 2 " show signature in cmd window

" dispatching
let test#strategy = "dispatch"
