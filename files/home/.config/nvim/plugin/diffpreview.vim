function! s:DiffPreview()
    tab split
    let ft=&filetype
    diffthis
    vsplit
    enew
    set buftype=nofile
    silent read #
    silent 1 delete
    let &filetype=ft
    diffthis
    wincmd l
endfunction

command! -bar DiffPreview :call s:DiffPreview()
