" gvim settings

set guioptions-=T  " hide toolbar
set guioptions-=m  " hide menubar
set vb t_vb=""     " disable visual bell

"set guifont=Bitstream\ Vera\ Sans\ Mono\ 8
"set guifont=Consolas\ 10
set guifont=Monospace\ 9

" make cursor red while in insert mode
set guicursor+=i:ver25-iCursor
highlight iCursor guibg=Red guifg=NONE
