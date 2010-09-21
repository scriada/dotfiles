" C/C++ file settings

" file indentation
setlocal expandtab
setlocal cindent
setlocal cinoptions+=:0,g0,(0

" folding
setlocal foldmethod=marker
setlocal foldmarker={,}
setlocal foldnestmax=10    " 10 levels max
setlocal foldlevel=10      " start at the top level
setlocal nofoldenable      " disable fold be default

" local keybindings ---------------------------

" magic enumeration converter
" 1. convert selection to uppercase
" 2. replace all whitespace between alphacharacters with an underscore
" 3. clear the search pattern
vmap <silent> <leader>e gUgv:s/[A-Z]\@<=\s[A-Z]\@=/_/g<CR>:let @/=""<CR>
