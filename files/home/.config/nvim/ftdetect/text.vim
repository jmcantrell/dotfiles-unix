augroup FiletypeDetectText
    autocmd BufRead,BufNewFile *.txt setlocal filetype=text
    autocmd BufRead,BufNewFile *.pem,*.asc,*.gpg,*.pgp setlocal filetype=text nobackup noswapfile noundofile
augroup END
