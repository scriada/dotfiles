" Theming
Plug 'catppuccin/nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ray-x/lsp_signature.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'github/copilot.vim'

Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
let test#strategy = "dispatch"
let test#python#runner = 'pytest'
