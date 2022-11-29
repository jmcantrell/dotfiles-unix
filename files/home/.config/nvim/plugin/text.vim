" Yank to end of line (similar to D).
noremap Y y$

" Format paragraph or selection.
nnoremap Q gqap
vnoremap Q gq

" Move visually selected lines up/down.
vnoremap <silent> K :move '<-2<cr>gv
vnoremap <silent> J :move '>+1<cr>gv

" Select the entire buffer.
nnoremap <leader>a ggVG

" Select the last inserted text.
nnoremap <expr> gi '`[' . strpart(getregtype(), 0, 1) . '`]'

" Split the current line at the cursor.
inoremap <c-j> <cr><esc>O
nmap <c-j> i<c-j>
