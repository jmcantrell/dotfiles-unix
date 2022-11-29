" Resize windows.
noremap <c-up>     <c-w>+
noremap <c-down>   <c-w>-
noremap <c-left>  3<c-w><
noremap <c-right> 3<c-w>>

" Maximize window fully (horizontal/vertical).
nmap <c-w>m <c-w>_<c-w><bar>

" Switch to the previous window.
nmap <c-w><c-w> :winc p<cr>

" Create a new vertical window.
nmap <c-w>N :vnew<cr>

" Close window even if there are unsaved changes.
nmap <c-w>C :close!<cr>

" Quit window even if there are unsaved changes.
nmap <c-w>Q :quit!<cr>
