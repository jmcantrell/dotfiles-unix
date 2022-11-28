setlocal shiftwidth=2 softtabstop=2 tabstop=2
setlocal commentstring=<!--%s-->

let b:ale_linter_aliases = ['html', 'css', 'javascript']
let b:ale_linters = ['stylelint', 'eslint']
let b:ale_fixers = ['prettier']

let b:fencing_options =
    \ {
    \ 'css': { 'commentstring': '/*%s*/' },
    \ 'javascript': { 'commentstring': '//%s' }
    \ }

let b:context_filetype_filetypes =
    \ { 'svelte': [
    \   {'filetype': 'css', 'start': '<style>', 'end': '</style>'},
    \   {'filetype': 'javascript', 'start': '<script\%( [^>]*\)\?>', 'end': '</script>'},
    \ ] }
