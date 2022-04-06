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
"    * provides a command instead of a plug
"    * uses script variables instead of globals
"    * uses win_gotoid instead of normal command

if exists("loaded_bd")
    finish
endif
let loaded_bd = 1

command! -bang BD call s:BD(<bang>0, 0)

function! s:BD(bang, stage)
    if a:stage == 0
        let s:bd_bufnr = bufnr("%")
        let s:bd_winid = win_getid()
        let s:bd_empty_bufnr = 0

        let s:bd_num_buffers = 0
        for i in range(1, bufnr("$"))
            if buflisted(i) && getbufvar(i, "&modifiable")
                let s:bd_num_buffers += 1
            endif
        endfor

        if !&modified || a:bang
            windo call s:BD(a:bang, a:stage + 1)
            call win_gotoid(s:bd_winid)
        endif

        execute "bd".(a:bang ? "!" : "")." ".s:bd_bufnr

        unlet s:bd_bufnr s:bd_winid
    else
        if bufnr("%") == s:bd_bufnr
            let alt_bufnr = bufnr("#")
            if s:bd_num_buffers <= 1 && s:bd_empty_bufnr != 0
                execute "b! ".s:bd_empty_bufnr
            elseif s:bd_num_buffers <= 1 && s:bd_empty_bufnr == 0
                enew!
                let s:bd_empty_bufnr = bufnr("%")
            elseif alt_bufnr > 0 && buflisted(alt_bufnr) && alt_bufnr != s:bd_bufnr
                b! #
            else
                bp!
            endif
        endif
    endif
endfunction
