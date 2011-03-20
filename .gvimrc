" gvim settings

set guioptions-=T  " hide toolbar
set guioptions-=m  " hide menubar
set vb t_vb=""     " disable visual bell

if has("win32")
    "set guifont=Monospace:h9
    set guifont=Consolas:h10
else
    "set guifont=Monospace\ 9
    set guifont=Consolas\ 10
endif

" make cursor red while in insert mode
set guicursor+=i:ver25-iCursor
highlight iCursor guibg=Red guifg=NONE
