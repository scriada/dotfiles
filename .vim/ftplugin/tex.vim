let b:tex_flavor = 'pdflatex'
compiler tex
setlocal errorformat=%f:%l:\ %m
setlocal makeprg=pdflatex\ -file-line-error\ -interaction=nonstopmode\ -shell-escape\ %
setlocal updatetime=1
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab 
setlocal smarttab 
setlocal nosmartindent
