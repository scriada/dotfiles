if exists("g:switch_loaded") && g:switch_loaded
	finish
endif
let g:switch_loaded = 1

if has("cscope")
    
    " Switch between header and cpp file using cscope
    function! SwitchFiles()
        let file = expand("%:t:r")
        let from_ext = expand("%:e")

        if from_ext == "h"
            let to_ext = "cpp"
        elseif from_ext == "cpp" || from_ext == "c"
            let to_ext = "h"
        endif

        execute ':cs find f '. file .'.'. to_ext
    endfunction

    :command! SwitchFiles :call SwitchFiles()

    " map ctrl-tab to switch files
    nmap <silent> [Z :call SwitchFiles()<CR>

endif
