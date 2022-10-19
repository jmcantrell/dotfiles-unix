if !executable('rg')
    finish
endif

set grepprg=rg\ --vimgrep
command! -nargs=+ -complete=file -bar Rg silent! grep! <args> | cwindow | redraw!
nnoremap <leader>/ :Rg<SPACE>
