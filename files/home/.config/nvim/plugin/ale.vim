let g:ale_hover_cursor = 0
let g:ale_completion_enabled = 1
let g:ale_floating_preview = 1
let g:ale_hover_to_floating_preview = 1
let g:ale_detail_to_floating_preview = 1
let g:ale_virtualtext_cursor = 0
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'] }

set omnifunc=ale#completion#OmniFunc

nmap <silent> <c-p> <plug>(ale_previous_wrap)
nmap <silent> <c-n> <plug>(ale_next_wrap)
nmap <silent> <leader>f <Plug>(ale_fix)
nmap <silent> <leader>r :ALERename<cr>
nmap <silent> <leader>i :ALEDetail<cr>
nmap <silent> gd :ALEGoToDefinition<cr>
nmap <silent> gD :ALEGoToTypeDefinition<cr>
nmap <silent> gr :ALEFindReferences<cr>
nmap <silent> K :ALEHover<cr>
