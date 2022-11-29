" Insert paths at command line.
cmap <c-g>p <c-r>=expand('%:p')<cr>
cmap <c-g>h <c-r>=expand('%:h').'/'<cr>
cmap <c-g>t <c-r>=expand('%:t')<cr>
cmap <c-g>r <c-r>=expand('%:r')<cr>
cmap <c-g>e <c-r>=expand('%:e')<cr>

" Copy the file name to the clipboard.
nmap <silent> gyf :call setreg('+', expand('%'), 'v')<cr>

" Copy the full file path to the clipboard.
nmap <silent> gyp :call setreg('+', expand('%:p'), 'v')<cr>

" Edit a file in the same directory as current file.
nmap <leader>e :e <c-r>=expand('%:h').'/'<cr>
