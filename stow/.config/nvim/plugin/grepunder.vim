function! s:GrepUnder(query)
    execute "vimgrep ".expand(a:query)."j **"
    cwindow
endfunction

command! -bar -nargs=? GrepUnder :call <sid>GrepUnder(<q-args>)

nmap <leader>g :GrepUnder /<c-r><c-w>/g
