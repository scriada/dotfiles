filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"============== Plugins =================

" Tools
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/QuickBuf'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'honza/vim-snippets'

" Language
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'
Plugin 'leafgarland/typescript-vim'
"Plugin 'eagletmt/ghcmod-vim'

" Theming
Plugin 'sheerun/vim-wombat-scheme'
Plugin 'chriskempson/base16-vim'
"Plugin 'godlygeek/csapprox'
"Plugin 'altercation/vim-colors-solarized'

"Plugin 'SirVer/ultisnips'
"let g:ultisnips_python_style="numpy"
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

Plugin 'vim-scripts/DoxygenToolkit.vim'
let g:load_doxygen_syntax=1

Plugin 'easymotion/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader>'

"Plugin 'scrooloose/syntastic'
"let g:syntastic_python_checkers = ['flake8', 'pyflakes']
"let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"Plugin 'davidhalter/jedi-vim'
"let g:jedi#force_py_version = 3
"let g:jedi#popup_on_dot = 0
"let g:jedi#show_call_signatures = 2 " show signature in cmd window

Plugin 'Valloric/YouCompleteMe'
let g:ycm_filetype_blacklist = { 'vue.html.javascript.css': 1 }
nmap <silent> <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <silent> <leader>k :YcmCompleter GetDoc<CR>

Plugin 'janko-m/vim-test'
Plugin 'tpope/vim-dispatch'
let test#strategy = "dispatch"

Plugin 'w0rp/ale'
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'typescript': ['eslint'],
\  'vue': ['eslint', 'vls'],
\  'java': ['javac'],
\  'python': ['flake8', 'pyflakes', 'mypy'],
\  'haskell': ['stack_ghc'],
\}
let g:ale_linters_explicit = 1
let g:ale_virtualenv_dir_names= [] " stop ale recursing up the directory looking for virtual envs

Plugin 'kien/ctrlp.vim'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

call vundle#end()
filetype plugin indent on
