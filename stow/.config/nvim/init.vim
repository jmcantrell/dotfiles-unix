" Break compatibility with vi.
set nocompatible

" Separate register contents with newlines.
set cpoptions+=>

" Enable mouse always.
set mouse=a

" Allow modified buffers to be hidden.
set hidden

" Highlight current line.
set cursorline

" Don't flash on errors.
set noerrorbells

" Use sensible tab settings.
set expandtab tabstop=4 softtabstop=4 shiftwidth=4

" Try to keep indentation consistent.
set smarttab copyindent autoindent shiftround

" Use case sensitivity only if search contains an upper case character.
set ignorecase smartcase infercase

" Backspace freely in insert mode.
set backspace=indent,eol,start

" Split new windows below and to the right of the current one.
set splitbelow splitright

" Disable intro message and hit-enter prompts.
set shortmess=IOoWtc

" Show invisible characters.
set listchars=tab:›·,nbsp:·,trail:·,precedes:‹,extends:›

" Break lines on word boundaries.
set nowrap linebreak

" Show line numbers and conserve space.
set number numberwidth=1

" Highlight matches while typing.
" Don't restore highlight on new sessions.
set hlsearch incsearch viminfo+=h

" Keep n lines visible above/below current line.
set scrolloff=5

" Allow undo history to span sessions.
set undofile

" Remember last n commands.
set history=1000

" Remember state in ~/.viminfo.
set viminfo+='1000  " marks for n files
set viminfo+=<1000  " no more than n lines per register
set viminfo+=s1000  " registers no larger than n kb

" Only show concealed symbol if cchar is defined.
set conceallevel=2

" Without this, when a line is too long, it's replaced by a string of @.
set display=lastline

" Abbreviate statusline indicators.
set shortmess+=a

" Show pending command under statusline.
set showcmd laststatus=2

" Show a menu for insert completion even if there's only one choice.
" Don't select or insert anything automatically.
set completeopt=menu,menuone,noselect,noinsert

" Use a menu for command line completion (ignoring case).
" Complete till the longest common string.
" If there is only one option, complete it.
set wildmenu wildignorecase wildmode=longest:full,list:full

" Enable auto formatting for commented text.
set textwidth=80 formatoptions+=corn

" Reformat paragraphs according to textwidth.
set formatoptions+=q

" Disable auto formatting for normal text.
set formatoptions-=t

" Set the window title.
set title titlestring=%{v:progname}\ %<%F

" Format the status line:

" buffer number, file path and status
set statusline=%#StatusLineBufferNr#%(\ %n\ %)%*
set statusline+=\ %f%(\ %#StatusLineFlag#%m%r%w%*%)

" left / right side separator
set statusline+=%=

" tuncation start
set statusline+=%<

" file type, line, column, percent through file
set statusline+=%(\ %{&ft}%)\ :%l\ +%c
set statusline+=\ %#StatusLinePercentNr#%(\ %P\ %)%*

" Set keys for <leader> and <localleader>.
let mapleader = "\<space>"
let maplocalleader = "\<cr>"

" Yank to end of line (similar to D).
noremap Y y$

" Open command window.
nnoremap <leader>; q:

" Format paragraph or selection.
nnoremap Q gqap
vnoremap Q gq

" Redraw screen and remove search highlights.
nnoremap <silent> <c-l> :noh<cr><c-l>

" Edit a file in the same directory as current file.
nmap <leader>e :e <c-r>=expand('%:h').'/'<cr>

" Switch buffer.
nmap <leader>b :b<space>

" Open help.
nmap <leader>h :h<space>

" Switch to last buffer.
nmap <leader><leader> :b#<cr>

" Show buffer number with other details.
nnoremap <c-g> 2<c-g>

" Delete buffer.
nmap <leader>d :bd<cr>
nmap <leader>D :bd!<cr>

" Write changes and delete buffer.
nmap <leader>w :w<cr>
nmap <leader>W :w<bar>bd<cr>

" Write changes to all buffers and quit.
nmap ZA :wqa<cr>

" Maximize window fully (horizontal/vertical).
nmap <c-w>m <c-w>_<c-w><bar>

" Switch to the previous window.
nmap <c-w><c-w> :winc p<cr>

" Create a new vertical window.
nmap <c-w>N :vnew<cr>

" Close window even if there are unsaved changes.
nmap <c-w>C :close!<cr>

" Quit window even if there are unsaved changes.
nmap <c-w>Q :quit!<cr>

" Resize windows.
noremap <c-up>     <c-w>+
noremap <c-down>   <c-w>-
noremap <c-left>  3<c-w><
noremap <c-right> 3<c-w>>

" Insert paths at command line.
cmap <c-g>p <c-r>=expand('%:p')<cr>
cmap <c-g>h <c-r>=expand('%:h').'/'<cr>
cmap <c-g>t <c-r>=expand('%:t')<cr>
cmap <c-g>r <c-r>=expand('%:r')<cr>
cmap <c-g>e <c-r>=expand('%:e')<cr>

" Select the entire buffer.
nnoremap <leader>a ggVG

" Move cursor to the end of yanked/pasted text.
nnoremap p p`]
vnoremap y y`]
vnoremap p p`]

" Select the last inserted text.
nnoremap <expr> gi '`[' . strpart(getregtype(), 0, 1) . '`]'

" Easier merging with vimdiff.
nmap gr :diffget RE<cr>
nmap gb :diffget BA<cr>
nmap gl :diffget LO<cr>

" Copy the file path to the clipboard.
nmap <silent> gyf :call setreg('+', expand('%:p'), 'v')<cr>

" Copy the file path (with line number) to the clipboard.
nmap <silent> gyl :call setreg('+', expand('%:p').':'.line('.'), 'v')<cr>

" Write file with sudo.
command! -bar W :w !sudo tee % >/dev/null<cr>

" Detect file type if name changes.
autocmd BufFilePost * filetype detect

" Reopen command window after executing.
autocmd CmdwinEnter * map <buffer> <tab> <cr>q:

" Enable file type plugins.
filetype plugin indent on

" Enable syntax highlighting.
syntax on

" Use a color scheme that inherits terminal colors.
color noctu

" Apply color scheme tweaks.
color custom
