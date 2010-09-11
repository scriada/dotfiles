" File: ide.vim
" Author: Adam Scriven
" Last Modified: 10th July 2009
"
" ide.vim provides a mechanism for vim to communicate with dbx (via screen) 
" Functions:
" :Dbx_Send [command] - send a command to dbx.
" :Dbx_Breakpoint     - set a breakpoint at the current cursor position. 
" :Dbx_Interrupt      - interrupt dbx if it is currently debugging a program.
"
" Default Keybindings:
" <leader>di - interrupt debugger
" <leader>dc - continue debugging
" <leader>db - set breakpoint at current line 
" <leader>dv - refresh view (i.e. place cursor at current instruction in program execution)
" <leader>dn - go to next instruction
" <leader>du - to up the stack frame
" <leader>dd - go down the stack frame
" <leader>ds - step to the next instruction
" <leader>do - step out of the current function
"
" ------------------------------------------------------------------------------------------------
if exists("g:loaded_ide")
  finish
endif
  
let g:loaded_ide = 1

let g:breakpt_num = 1 " used to keep track of the number of breakpoints

" define breakpoint sign
:sign define breakpt text=* 

" generic function to send signals to dbx
function! s:Dbx_Send(cmd)
    "let ret = system("screen -S " . $STY . " -p dbx -X stuff '" . a:cmd . " '")
    let ret = system("tmux send -t 1 '" . a:cmd . "'")
endfunction 

"  interrupt dbx
function! s:Dbx_Interrupt()
    "let ret = system("screen -S " . $STY . " -p dbx -X stuff ''")
    let ret = system("tmux send -t 1 ''")
endfunction 

" set breakpoint at the at the current line in the current file
function! s:Dbx_Breakpoint()
    let lineno   = line(".")
    let filepath = expand("%:p")
    call s:Dbx_Send("stop at " . filepath . ":" . lineno)

    " mark the breakpoint with a sign
    exe ":sign place ". g:breakpt_num ." line=". lineno ." name=breakpt file=". filepath 
    "g:breakpt_num++;
endfunction

command! -nargs=1 Dbx        :call <SID>Dbx_Send(<f-args>) 
command! -nargs=0 DbxBreak   :call <SID>Dbx_Breakpoint(<f-args>) 
command! -nargs=0 DbxStop    :call <SID>Dbx_Interrupt(<f-args>)

map <silent> <leader>xb :exe ":DbxBreak"<CR>
map <silent> <leader>xi :exe ":DbxStop"<CR>
map <silent> <leader>xn :exe ":Dbx next;vc"<CR>
map <silent> <leader>xu :exe ":Dbx up;vc"<CR>
map <silent> <leader>xd :exe ":Dbx down;vc"<CR>
map <silent> <leader>xv :exe ":Dbx vc"<CR>
map <silent> <leader>xs :exe ":Dbx step;vc"<CR>
map <silent> <leader>xo :exe ":Dbx step up;vc"<CR>
map <silent> <leader>xc :exe ":Dbx cont"<CR>
