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

    " shift-tab switch between header and cpp file
    nmap <S-Tab> :call SwitchFiles()<CR>
endif
