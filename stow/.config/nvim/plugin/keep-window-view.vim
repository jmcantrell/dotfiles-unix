" Save/restore window view when leaving/entering buffers.
" Among other things, this saves the position of the cursor.
autocmd BufLeave * let b:winview = winsaveview()
autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
