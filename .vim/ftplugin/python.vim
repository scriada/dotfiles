" Python specific settings

setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab smarttab nosmartindent

" trim trailing whitespace each time file is saved
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
