" break compatibility with vi
set nocompatible

" separate register contents with newlines
set cpoptions+=>

" enable mouse always
set mouse=a

" allow modified buffers to be hidden
set hidden

" highlight current line
set cursorline

" don't flash on errors
set noerrorbells

" sensible tab settings
set expandtab tabstop=4 softtabstop=4 shiftwidth=4

" try to keep indention consistent
set smarttab copyindent autoindent shiftround

" case sensitive if search contains upper case
set ignorecase smartcase infercase

" backspace freely in insert mode
set backspace=indent,eol,start

" new windows start below current one
set splitbelow

" new windows start to the right of current one
set splitright

" disable intro message and hit-enter prompts
set shortmess=IOoWtc

" show invisible characters
set listchars=tab:›·,nbsp:·,trail:·,precedes:‹,extends:›

" line wrapping on word boundaries
set nowrap linebreak

" line numbers in the left column
set number numberwidth=1

" highlight matches while typing
set hlsearch incsearch viminfo+=h

" keep n lines visible above/below current line
set scrolloff=5

" allow undo history to span sessions
set undofile

" remember last n commands
set history=1000

" remember state in ~/.viminfo
set viminfo+='1000  " marks for n files
set viminfo+=<1000  " no more than n lines per register
set viminfo+=s1000  " registers no larger than n kb

" keys for <leader> and <localleader>
let mapleader = "\<space>"
let maplocalleader = "\<cr>"

" yank to end of line
noremap Y y$

" goto beginning/end of line
noremap  H ^
noremap  L $
vnoremap L g_

" familiar from sh
cnoremap <c-b> <home>
cnoremap <c-e> <end>

" open command window
nnoremap <leader>; q:

" reopen command window after executing
autocmd CmdwinEnter * map <buffer> <tab> <cr>q:

" only show concealed symbol if cchar is defined
set conceallevel=2

" when a line is too long, it's replaced by a string of @
set display=lastline  " why hide the whole line?? @@@@@@@

" abbreviate statusline indicators
set shortmess+=a

" show pending command under statusline
set showcmd laststatus=2

" redraw screen and remove search highlights
nnoremap <silent> <c-l> :noh<cr><c-l>

" write with sudo
command! -bar W :w !sudo tee % >/dev/null<cr>

" edit a file in the same directory as current file
nmap <leader>e :e <c-r>=expand('%:h').'/'<cr>

" quickly change filetype (with tab completion)
nmap <leader>f :setfiletype<space>

" switch buffer
nmap <leader>b :b<space>

" open help
nmap <leader>h :h<space>

" switch to last buffer
nmap <leader><leader> :b#<cr>

" show buffer number with other details
nnoremap <c-g> 2<c-g>

" delete buffer
nmap DD :bd<cr>

" write changes and delete buffer
" similar to ZZ for the current window
nmap XX :w<bar>bd<cr>

" write changes to all buffers and quit
nmap ZA :wqa<cr>

" maximize window fully (horizontal/vertical)
nmap <c-w>m <c-w>_<c-w><bar>

" switch to previous window
nmap <c-w><c-w> :winc p<cr>

" create new vertical window
nmap <c-w>N :vnew<cr>

" close window even if there are unsaved changes
nmap <c-w>C :close!<cr>

" quit window even if there are unsaved changes
nmap <c-w>Q :quit!<cr>

" resize windows
noremap <c-up>     <c-w>+
noremap <c-down>   <c-w>-
noremap <c-left>  3<c-w><
noremap <c-right> 3<c-w>>

" insert paths at command line
cmap <c-g>p <c-r>=expand('%:p')<cr>
cmap <c-g>h <c-r>=expand('%:h').'/'<cr>
cmap <c-g>t <c-r>=expand('%:t')<cr>
cmap <c-g>r <c-r>=expand('%:r')<cr>
cmap <c-g>e <c-r>=expand('%:e')<cr>

" select all
nnoremap <leader>a ggVG

" correct previous misspelling
nnoremap <leader>s [s1z=<c-o>

" move to end of yanked/pasted text
nnoremap p p`]
vnoremap y y`]
vnoremap p p`]

" select last inserted text
nnoremap <expr> gi '`[' . strpart(getregtype(), 0, 1) . '`]'

" vimdiff merging (r=remote,b=base,l=local)
nmap gr :diffget RE<cr>
nmap gb :diffget BA<cr>
nmap gl :diffget LO<cr>

" paste from clipboard
nnoremap gp "+p
nnoremap gP "+P
vnoremap gp "+p

" copy line(s) to clipboard
vnoremap gy  "+y
nnoremap gyy "+yy

" copy filepath to clipboard
nmap gyf :call setreg('+', expand('%:p'), 'v')<cr>

" copy filepath with line to clipboard
nmap gyl :call setreg('+', expand('%:p').':'.line('.'), 'v')<cr>

" keyword, filename completion
inoremap <c-f> <c-x><c-f>

" code (aka omni) completion
inoremap <c-b> <c-x><c-o>

" user must manually select completion
set completeopt=menu,menuone,noselect,noinsert

" command line completion
set wildmenu wic wim=longest:full,list:full

" enable auto formatting for commented text
set textwidth=80 formatoptions+=corn

" reformat paragraphs according to textwidth
set formatoptions+=q

" disable auto formatting for normal text
set formatoptions-=t

" auto format paragraph or selection
nnoremap Q gqap
vnoremap Q gq

filetype plugin indent on

" detect filetype if name changes
autocmd BufFilePost * filetype detect

" syntax highlighting
syntax on

" colorscheme that inherits terminal colors
color noctu

" colorscheme overrides
color custom

set title titlestring=%{v:progname}\ %<%F

" buffer number, file path and status
set statusline=%#StatusLineBufferNr#%(\ %n\ %)%*
set statusline+=\ %f%(\ %#StatusLineFlag#%m%r%w%*%)

set statusline+=%=  " left / right side separator

" start truncation here
set statusline+=%<

" file type, line, column, percent through file
set statusline+=%(\ %{&ft}%)\ :%l\ +%c
set statusline+=\ %#StatusLinePercentNr#%(\ %P\ %)%*
