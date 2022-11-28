setlocal shiftwidth=2 softtabstop=2 tabstop=2
setlocal formatoptions+=tcl
setlocal wrap

let b:ale_fixers = ['prettier']

let b:fencing_options =
    \ {
    \ 'css': { 'commentstring': '/*%s*/' },
    \ 'javascript': { 'commentstring': '//%s' }
    \ }

let b:closetag_html_style = 1
runtime! macros/closetag.vim
