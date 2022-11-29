" Open command window.
nnoremap <leader>; q:

" Re-open command window after executing.
augroup CommandWindowKeepOpen
    autocmd CmdwinEnter * map <buffer> <tab> <cr>q:
augroup END
