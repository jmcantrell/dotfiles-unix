augroup ftdetect-sensitive
    autocmd BufRead,BufNewFile *.pem,*.asc,*.gpg,*.pgp setlocal filetype=text nobackup noswapfile noundofile
augroup END
