set runtimepath^=~/.vim runtimepath+=~/.vim/after   
let &packpath = &runtimepath                        

source ~/.vimrc                                     

" run after vimrc so plugins are setup
lua require('init')
