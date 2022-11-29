" Re-detect file type if name changes.
augroup FiletypeDetectOnRename
    autocmd BufFilePost * filetype detect
augroup END
