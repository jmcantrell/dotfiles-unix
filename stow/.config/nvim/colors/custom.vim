hi SignColumn            ctermbg=none
hi Normal     cterm=none ctermbg=none
hi Search     cterm=none ctermbg=11   ctermfg=0
hi IncSearch  cterm=none ctermbg=11   ctermfg=0
hi ErrorMsg   cterm=bold ctermbg=none ctermfg=1
hi WarningMsg cterm=bold ctermbg=none ctermfg=2
hi Conceal    cterm=none ctermbg=none ctermfg=2
hi MatchParen cterm=bold ctermbg=3    ctermfg=15
hi WildMenu   cterm=bold ctermbg=3    ctermfg=15

" active statusline is bold
hi StatusLine   cterm=bold ctermbg=none
hi StatusLineNC cterm=none ctermbg=none

" certain info should stand out
hi StatusLineFlag cterm=bold ctermfg=3

" these should stand out even more
hi StatusLineBufferNr  cterm=bold ctermbg=1 ctermfg=15
hi StatusLinePercentNr cterm=bold ctermbg=4 ctermfg=15

" split shouldn't stand out
hi VertSplit ctermbg=none ctermfg=0

" cursor location
hi CursorColumn ctermbg=0
hi CursorLine   ctermbg=0
hi CursorLineNr ctermbg=0 ctermfg=3 cterm=none

" dim text to not stand out
hi LineNr ctermbg=none ctermfg=8

" light text is easier to read here
hi StatusLine cterm=bold ctermfg=15
hi DiffChange cterm=bold ctermfg=15
hi DiffAdd    cterm=bold ctermfg=15
hi DiffDelete cterm=bold ctermfg=15

hi Folded     ctermbg=0 ctermfg=8
hi FoldColumn ctermbg=0 ctermfg=8
