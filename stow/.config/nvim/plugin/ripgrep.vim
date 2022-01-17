if executable('rg')
    set grepprg=rg\ -i\ --vimgrep
    command! -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
    nnoremap <leader>/ :Rg<SPACE>
endif
