let b:closetag_html_style = 1

runtime! macros/closetag.vim

setlocal formatoptions+=tcl
setlocal wrap

let b:ale_fixers = ['prettier']

let b:fencing_options =
	\ {
	\ 'javascript': { 'commentstring': '//%s' },
	\ 'css': { 'commentstring': '/*%s*/' }
	\ }

EmmetInstall
