if !executable('rg')
    finish
endif

set grepprg=rg\ -i\ --vimgrep
command! -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
nnoremap <leader>/ :Rg<SPACE>
