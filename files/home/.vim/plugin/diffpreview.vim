function! s:DiffPreview()
    tab split
    let ft=&ft
    diffthis
    vsplit
    enew
    set buftype=nofile
    silent read #
    silent 1 delete
    let &ft=ft
    diffthis
    wincmd l
endfunction

command! -bar DiffPreview :call s:DiffPreview()
