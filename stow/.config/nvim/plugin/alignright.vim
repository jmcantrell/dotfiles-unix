function! s:Retab(string)
    let rv = ''
    let i = 0
    for char in split(a:string, '\zs')
        if char == '\t'
            let rv .= repeat(' ', &ts - i)
            let i = 0
        else
            let rv .= char
            let i = (i + 1) % &ts
        endif
    endfor
    return rv
endfunction

function! s:AlignRight(...)
    if getline('.') =~ '^\s*$'
        call setline('.', '')
    else
        let line = s:Retab(getline('.'))
        let prefix = matchstr(line, '.*\%' . virtcol('.') . 'v')
        let suffix = matchstr(line, '\%' . virtcol('.') . 'v.*')
        let prefix = substitute(prefix, '\s*$', '', '')
        let suffix = substitute(suffix, '^\s*', '', '')
        let len  = len(substitute(prefix, '.', 'x', 'g'))
        let len += len(substitute(suffix, '.', 'x', 'g'))
        let width  = (a:0 == 1 ? a:1 : (&tw <= 0 ? 80 : &tw))
        let spaces = width - len
        call setline('.', prefix . repeat(' ', spaces) . suffix)
    endif
endfunction

command! -nargs=? AlignRight :call s:AlignRight(<f-args>)
