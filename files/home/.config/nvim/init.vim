scriptencoding utf-8

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

" Use tabs for indentation and display them as four spaces.
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
set textwidth=79 formatoptions+=corn

" Reformat paragraphs according to textwidth.
set formatoptions+=q

" Disable auto formatting for normal text.
set formatoptions-=t

" Set the window title.
set title titlestring=%{v:progname}\ %<%F

" Set spellcheck options.
set spelllang=en_us spellfile=~/.vim/spell/en.utf-8.add

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

" Enable file type plugins.
filetype plugin indent on

" Enable syntax highlighting.
syntax on

" Use a color scheme that inherits terminal colors.
color noctu

" Apply color scheme tweaks.
color custom
