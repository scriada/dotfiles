" Switch between header and cpp file

function! SwitchFiles()
    let from_ext = expand("%:e")

    if from_ext == "h" || from_ext == "hpp"
        let to_ext = ["c", "cpp"]
    elseif from_ext == "c" || from_ext == "cpp"
        let to_ext = ["h", "hpp"]
    else
        echo "unsupported file extension: ". from_ext
        return
    endif

    let filename = expand("%:t:r")
    let file     = expand("%:r")

    " try same dir
    for ext in to_ext
        let f = file .'.'. ext
        if filereadable(f)
            execute ':e '. f
            return
        endif
    endfor
    
    " try :find
    for ext in to_ext
        let f = filename .'.'. ext
        try
            execute ':find '. f
        catch /E345:/
            continue
        endtry
        return
    endfor

    " try cscope
    if has("cscope") && cscope_connection()
        for ext in to_ext
            try
                execute ':cs find f '. filename .'.'. ext
            catch /E259:/
                continue
            endtry
            return
        endfor
    endif

    echo "could not switch"
        
endfunction

:command! SwitchFiles :call SwitchFiles()

" shift-tab switch between header and cpp file
nmap <S-Tab> :call SwitchFiles()<CR>
