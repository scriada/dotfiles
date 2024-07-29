set runtimepath^=~/.vim runtimepath+=~/.vim/after   
let &packpath = &runtimepath                        

" ~/.config/nvim/lua/init.lua setup for MATLAB lsp
lua require('init')

source ~/.vimrc                                     
