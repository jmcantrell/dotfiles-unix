" Improved version of kwbdi.vim:
" https://www.vim.org/scripts/script.php?script_id=2103

" Ensures window layout is not changed.
"
" When the buffer is deleted, the order of preference for its replacement is:
"    * alternate buffer
"    * previous buffer
"    * empty buffer

" Changes from original script:
"    * respects <bang>
"    * creates no mappings
"    * accepts a count (e.g. :2BD)
"    * provides a command instead of a plug
"    * uses script variables instead of globals
"    * uses win_gotoid instead of normal command

if exists("loaded_bd")
    finish
endif
let loaded_bd = 1

function s:count_buffers()
    let result = 0
    for i in range(1, bufnr("$"))
        if buflisted(i) && getbufvar(i, "&modifiable")
            let result += 1
        endif
    endfor
    return result
endfunction

function s:select_alt_buffer(primary_bufnr)
    if bufnr("%") != a:primary_bufnr
        return
    endif

    if s:num_buffers <= 1
        if s:empty_bufnr == 0
            enew!
            let s:empty_bufnr = bufnr("%")
        else
            execute "b! ".s:empty_bufnr
        endif
    else
        let alt_bufnr = bufnr("#")
        if alt_bufnr > 0 && buflisted(alt_bufnr) && alt_bufnr != a:primary_bufnr
            b! #
        else
            bp!
        endif
    endif
endfunction

function! s:BD(bang, count)
    let primary_bufnr = a:count == 0 ? bufnr("%") : a:count

    let s:num_buffers = s:count_buffers()

    if !&modified || a:bang
        let s:empty_bufnr = 0
        let primary_winid = win_getid()
        windo call s:select_alt_buffer(primary_bufnr)
        call win_gotoid(primary_winid)
    endif

    execute "bd".(a:bang ? "!" : "")." ".primary_bufnr
endfunction

command! -bang -count BD call s:BD(<bang>0, <count>)
