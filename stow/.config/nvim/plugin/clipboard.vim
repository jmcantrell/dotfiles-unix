" nnoremap gp "+p
" vnoremap gp "+p

" nnoremap gP "+P
" vnoremap gP "+P

" nnoremap <expr> gy YankClipboard()
" xnoremap <expr> gy YankClipboard()
" nnoremap <expr> gyy YankClipboard() .. '_'

function YankClipboard(type = '') abort
    if a:type == ''
        set opfunc=YankClipboard
        return 'g@'
    endif

    let selection_save = &selection
    let clipboard_save = &clipboard
    let visual_start = getpos("'<")
    let visual_end = getpos("'>")

    try
        set clipboard= selection=inclusive
        let commands = #{line: "'[V']\"+y", char: "`[v`]\"+y", block: "`[\<c-v>`]\"+y"}
        silent exe 'keepjumps normal! ' .. get(commands, a:type, '')
    finally
        call setpos("'<", visual_start)
        call setpos("'>", visual_end)
        let &selection = selection_save
        let &clipboard = clipboard_save
    endtry
endfunction
