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

function s:join_path(...)
    return join(a:000, "/")
endfunction

function s:get_var(var)
    return exists(a:var) ? eval(a:var) : v:null
endfunction

function s:get_files_recursive(dir)
    return filter(glob(a:dir."/**", 0, 1), '!isdirectory(v:val)')
endfunction

function s:get_data_dir()
    let default_dir = s:join_path(s:first($XDG_DATA_HOME, s:join_path($HOME, ".local", "share")), "snip")
    return s:first(s:get_var("b:snip_data_dir"), s:get_var("g:snip_data_dir"), $SNIP_DATA_DIR, default_dir)
endfunction

function s:get_data_names()
    let dir = s:get_data_dir()
    return map(s:get_files_recursive(dir), 'fnamemodify(v:val, ":s#^'.dir.'/##")')
endfunction

function s:get_data_file(name)
    return s:join_path(s:get_data_dir(), a:name)
endfunction

function s:complete_names(arglead, cmdline, pos)
    return filter(s:get_data_names(), 'match(v:val, "^'.a:arglead.'") >= 0')
endfunction

function s:snip_put(bang, name) range
    let line = a:bang ? a:firstline - 1 : a:firstline
    execute line."read ".s:get_data_file(a:name)
endfunction

command -bang -range -nargs=1 -complete=customlist,s:complete_names SnipPut <line1>call s:snip_put(<bang>0, <q-args>)
