set runtimepath^=~/.vim runtimepath+=~/.vim/after   
let &packpath = &runtimepath                        

source ~/.vimrc                                     
"
" ~/.config/nvim/lua/init.lua setup for MATLAB lsp
lua require('init')
