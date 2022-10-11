if exists("g:loaded_snip")
    finish
endif
let g:loaded_snip = 1

function s:first(...)
    for value in a:000
        if ! empty(value)
            return value
        endif
    endfor
endfunction

function s:var_or_null(name)
    return exists(a:name) ? eval(a:name) : v:null
endfunction

function s:nearest_var(name)
    return s:first(s:var_or_null("b:".a:name), s:var_or_null("g:".a:name))
endfunction

function s:snip_command(action, name)
    let data_dir = s:nearest_var("snip_data_dir")
    let command = ["snip"]
    if ! empty(data_dir)
        call add(command, "-D", fnameescape(data_dir))
    endif
    call add(command, a:action)
    if ! empty(a:name)
        call add(command, fnameescape(a:name))
    endif
    return join(command, " ")
endfunction

function s:complete_snip_names(arglead, cmdline, pos) abort
    return filter(systemlist(s:snip_command("list", v:null)), 'match(v:val, "^'.a:arglead.'") >= 0')
endfunction

function s:snip_edit(name) abort
    execute "edit ".system(s:snip_command("path", a:name))
endfunction

function s:snip_delete(name) abort
    call system(s:snip_command("delete", a:name))
endfunction

function s:snip_write(name) abort range
    execute "silent ".a:firstline.",".a:lastline."write !".s:snip_command("write", a:name)
endfunction

function s:snip_read(bang, name) abort range
    let line = a:bang ? a:firstline - 1 : a:firstline
    execute line."read !".s:snip_command("read", a:name)
endfunction

command -nargs=1 -complete=customlist,s:complete_snip_names SnipEdit call s:snip_edit(<q-args>)
command -nargs=1 -complete=customlist,s:complete_snip_names SnipDelete call s:snip_delete(<q-args>)
command -range=% -nargs=1 -complete=customlist,s:complete_snip_names SnipWrite <line1>,<line2>call s:snip_write(<q-args>)
command -bang -range -nargs=1 -complete=customlist,s:complete_snip_names SnipRead <line1>call s:snip_read(<bang>0, <q-args>)
