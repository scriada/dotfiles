" vim600: set foldmethod=marker:
"
" Vim utility plugin to pipe visual selections into external commands, in the
" same way as vim filters, but without modifying the buffer.
"
" Documentation:
"
" Default mapping:
" vmap # :Pipe<space>
"
" Examples: 
"
" 1. Perform operations on a list of files:
"   /path/to/file/one
"   /path/to/file/two
"
"   :'<,'>Pipe ls -la                - display detailed information about files 
"   :'<,'>Pipe xargs cvs commit      - commit a list of files to a cvs repository
"   
" 2. Execute a shell script
"   echo 'hi';
"   echo 'bye;'
"
" :'<,'>Pipe sh                      - run selected script
"
" 3. Run SQL commands:
"   SELECT * from database1.table1;
"
" :'<,'>Pipe mysql -u user -p        - pipe an SQL command to mysql.
" :'<,'>Pipe mysql -u user           - pipe an SQL command to mysql, prompting for password.
" :'<,'>Pipe mysql -u user > output  - pipe an SQL command to mysql, and pipe the output to the file 'output'

if exists("g:loaded_visualpipe")
  finish
endif
  
let g:loaded_visualpipe = 1

function PipeSelectionToCommand(cmd) range
    let lines = getline(a:firstline, a:lastline)  
    let input = join(lines, " ")
    echo system(a:cmd, input)
endfunction

command! -nargs=* -range Pipe <line1>,<line2> call PipeSelectionToCommand(<q-args>)

vmap # :Pipe<space>
