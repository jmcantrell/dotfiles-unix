if exists("g:loaded_snippets")
    finish
endif
let g:loaded_snippets = 1

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

function s:snippets_command(action, name)
    let data_dir = s:nearest_var("snippets_data_dir")
    let command = ["snippets"]
    if ! empty(data_dir)
        call add(command, "-D", fnameescape(data_dir))
    endif
    call add(command, a:action)
    if ! empty(a:name)
        call add(command, fnameescape(a:name))
    endif
    return join(command, " ")
endfunction

function s:complete_snippets_names(arglead, cmdline, pos) abort
    return filter(systemlist(s:snippets_command("list", v:null)), 'match(v:val, "^'.a:arglead.'") >= 0')
endfunction

function s:snippets_edit(name) abort
    execute "edit ".system(s:snippets_command("path", a:name))
endfunction

function s:snippets_delete(name) abort
    call system(s:snippets_command("delete", a:name))
endfunction

function s:snippets_write(name) abort range
    execute "silent ".a:firstline.",".a:lastline."write !".s:snippets_command("write", a:name)
endfunction

function s:snippets_read(bang, name) abort range
    let line = a:bang ? a:firstline - 1 : a:firstline
    execute line."read !".s:snippets_command("read", a:name)
endfunction

command -nargs=1 -complete=customlist,s:complete_snippets_names SnippetsEdit call s:snippets_edit(<q-args>)
command -nargs=1 -complete=customlist,s:complete_snippets_names SnippetsDelete call s:snippets_delete(<q-args>)
command -range=% -nargs=1 -complete=customlist,s:complete_snippets_names SnippetsWrite <line1>,<line2>call s:snippets_write(<q-args>)
command -bang -range -nargs=1 -complete=customlist,s:complete_snippets_names SnippetsRead <line1>call s:snippets_read(<bang>0, <q-args>)
