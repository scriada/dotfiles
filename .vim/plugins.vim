filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"============== Plugins =================

" Tools
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'janko-m/vim-test'
Plugin 'vim-scripts/QuickBuf'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'

" Language
Plugin 'w0rp/ale'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'rust-lang/rust.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'scrooloose/syntastic'
"Plugin 'eagletmt/ghcmod-vim'

" Theming
Plugin 'sheerun/vim-wombat-scheme'
Plugin 'chriskempson/base16-vim'
"Plugin 'godlygeek/csapprox'
"Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on

"============ Configuation ==============

"let g:ultisnips_python_style="numpy"
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Doxygen
let g:load_doxygen_syntax=1

let g:EasyMotion_leader_key = '<Leader>'

" Syntastic
"let g:syntastic_python_checkers = ['flake8', 'pyflakes']
"let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" JEDI
"let g:jedi#force_py_version = 3
"let g:jedi#popup_on_dot = 0
"let g:jedi#show_call_signatures = 2 " show signature in cmd window

" dispatching
let test#strategy = "dispatch"

" ALE
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'python': ['flake8', 'pyflakes'],
\}
let g:ale_linters_explicit = 1

" CtrlP
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif
