if !exists("g:vpaste_options")
	let g:vpaste_options = 'bg=dark'
endif

function! s:GetOptions()
	let ft = ',ft=' . &ft
	let nu = &nu ? ',nu' : ''
	let et = &et ? ',et,ts=' . &ts : ''
	return g:vpaste_options . nu . et . ft
endfunction

map <silent> <leader>p :exec "w !vpaste ".<sid>GetOptions()<cr>
vmap <silent> <leader>p <esc>:exec "'<,'>w !vpaste ".<sid>GetOptions()<cr>
