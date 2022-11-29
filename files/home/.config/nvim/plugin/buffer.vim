" Switch buffer.
nmap <leader>b :b<space>

" Switch to last buffer.
nmap <leader><leader> :b#<cr>

" Show buffer number with other details.
nnoremap <c-g> 2<c-g>

" Delete buffer.
nmap <leader>d :BD<cr>
nmap <leader>D :BD!<cr>

" Close window.
nmap <leader>c :close<cr>
nmap <leader>C :close!<cr>

" Write changes and delete buffer.
nmap <leader>w :w<cr>
nmap <leader>W :w<bar>bd<cr>

" Write changes to all buffers and quit.
nmap ZA :wqa<cr>
