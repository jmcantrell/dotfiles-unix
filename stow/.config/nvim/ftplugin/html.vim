let b:closetag_html_style = 1

runtime! macros/closetag.vim

setlocal sw=2 sts=2 ts=2
setlocal formatoptions+=tcl
setlocal wrap

let b:ale_fixers = ['prettier']

let b:fencing_options =
	\ {
	\ 'javascript': { 'commentstring': '//%s' },
	\ 'css': { 'commentstring': '/*%s*/' }
	\ }

EmmetInstall
