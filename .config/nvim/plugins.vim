" Theming
Plug 'catppuccin/nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'EdenEast/nightfox.nvim'

" navitation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scriada/QuickBuf'
Plug 'christoomey/vim-tmux-navigator'

" dev
Plug 'stevearc/aerial.nvim'
Plug 'tpope/vim-fugitive'
Plug 'ray-x/lsp_signature.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'github/copilot.vim'
let g:copilot_node_command='~/.nvm/versions/node/v22.19.0/bin/node'
" disable Copilot by default. Prompt for suggestion with M-\
let g:copilot_filetypes = {
    \ '*': v:false,
    \ }

" testing
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
let test#strategy = "dispatch"
let test#python#runner = 'pytest'

" LateX
Plug 'lervag/vimtex', { 'on': ['VimtexCompile'] }
let g:vimtex_view_general_viewer="evince"
let g:vimtex_compiler_method="latexmk"
