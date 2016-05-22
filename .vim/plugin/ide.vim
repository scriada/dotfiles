" File: ide.vim
" Author: Adam Scriven
" Last Modified: 10th July 2009
"
" ------------------------------------------------------------------------------------------------
if exists("g:loaded_ide")
  finish
endif
  
let g:ide_loaded = 1
let g:ide_ipython_pane_id = -1

" generic function to send-keys to a tmux pand
function! s:TmuxSend(id, cmd)
    let ret = system("tmux send-keys -t %". a:id ." '". a:cmd ."'")
endfunction 

" Get a list of current tmux pane ids on the current window
"   returns: list of ints
function! s:TmuxPanes()
    let ret = system("tmux list-panes -F '#{pane_id}'")
    let pane_ids = map(split(substitute(ret, "\%\\(\\d\\+\\)", "\\1", "g"), "\n"), "str2nr(v:val)")
    return pane_ids
endfunction

function! s:IPythonPaste() range
    " copy the current visual selection into the system (+) buffer
    normal! gv"+y
    call s:TmuxSend(g:ide_ipython_pane_id, '%paste')
endfunction 

" Create an IPython shell in a new pane, if one doesnt already exist
function! s:IPythonShell()
    if index(s:TmuxPanes(), g:ide_ipython_pane_id) == -1
        let venv = $VIRTUAL_ENV
        if venv != ""
            let cmd = "bash -c 'source ". $VIRTUAL_ENV ."/bin/activate; ipython'"
        else
            let cmd = "ipython"
        endif
        let ret = system("tmux split-window -p 30 \"". cmd ."\"")
        let g:ide_ipython_pane_id = max(s:TmuxPanes())
    endif
endfunction 

function! s:IPythonRun()
    call s:IPythonShell()
    let file = expand('%')
    call s:TmuxSend(g:ide_ipython_pane_id, "%run ". file)
endfunction 

command -nargs=0 IPythonShell :call <SID>IPythonShell(<f-args>)
command -nargs=0 IPythonRun   :call <SID>IPythonRun(<f-args>)

vmap <silent> <C-x> :call <SID>IPythonPaste()<CR>
