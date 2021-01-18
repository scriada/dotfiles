"============== Plugins =================

" Tools
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'scriada/QuickBuf'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'honza/vim-snippets'

" Language
Plug 'jmcantrell/vim-virtualenv'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['py=python']
"Plug 'eagletmt/ghcmod-vim'

Plug 'kovisoft/slimv'
let g:slimv_impl = 'sbcl'
let g:slimv_swank_cmd = '! tmux new-window -d -n REPL-SBCL "sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp"'
let g:slimv_keybindings = 1

" Theming
Plug 'sheerun/vim-wombat-scheme'
"Plug 'chriskempson/base16-vim'
Plug 'danielwe/base16-vim'
"Plug 'godlygeek/csapprox'
"Plug 'altercation/vim-colors-solarized'

"Plug 'SirVer/ultisnips'
"let g:ultisnips_python_style="numpy"
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

Plug 'xuhdev/vim-latex-live-preview'
let g:livepreview_previewer = 'evince'
let g:livepreview_engine = 'pdflatex'

Plug 'vim-scripts/DoxygenToolkit.vim'
let g:load_doxygen_syntax=1

Plug 'easymotion/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader>'

"Plug 'scrooloose/syntastic'
"let g:syntastic_python_checkers = ['flake8', 'pyflakes']
"let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"Plug 'davidhalter/jedi-vim'
"let g:jedi#force_py_version = 3
"let g:jedi#popup_on_dot = 0
"let g:jedi#show_call_signatures = 2 " show signature in cmd window

Plug 'Valloric/YouCompleteMe', { 'on': [] }
let g:ycm_filetype_blacklist = {
\  'vue.html.javascript.css': 1,
\  'markdown': 1,
\  'txt': 1,
\  'inform': 1,
\}
nmap <silent> <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <silent> <leader>k :YcmCompleter GetDoc<CR>

Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
let test#strategy = "dispatch"
let test#python#runner = 'pytest'

Plug 'w0rp/ale', { 'on': [] }
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'typescript': ['eslint'],
\  'vue': ['eslint', 'vls'],
\  'java': ['javac'],
\  'python': ['flake8', 'pyflakes', 'mypy'],
\  'haskell': ['stack_ghc'],
\  'yaml': ['yamllint'],
\  'rust': ['cargo'],
\  'c': ['gcc'],
\}
let g:ale_linters_explicit = 1
let g:ale_virtualenv_dir_names= [] " stop ale recursing up the directory looking for virtual envs

Plug 'kien/ctrlp.vim'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif
