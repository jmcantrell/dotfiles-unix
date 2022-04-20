let b:ale_linter_aliases = ['html', 'javascript', 'css']
let b:ale_linters = ['stylelint', 'eslint']
let b:ale_fixers = ['prettier']

let b:fencing_options =
    \ {
    \ 'javascript': { 'commentstring': '//%s' },
    \ 'css': { 'commentstring': '/*%s*/' }
    \ }

let b:context_filetype_filetypes =
    \ { 'svelte': [
    \   {'filetype': 'javascript', 'start': '<script\%( [^>]*\)\?>', 'end': '</script>'},
    \   {'filetype': 'css', 'start': '<style>', 'end': '</style>'},
    \ ] }

" EmmetInstall

setlocal shiftwidth=2 softtabstop=2 tabstop=2
setlocal commentstring=<!--%s-->
