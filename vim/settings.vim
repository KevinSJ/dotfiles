" Background color to dark, might be better
" to leave this in the main file
set background=dark

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000
set updatetime=300

" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/vendor/bundle/*
set wildignore+=*/node_modules/

"-------------------------------------------------------------------------------
" Interface
"-------------------------------------------------------------------------------

" Use vim, not vi api
set nocompatible

" No backup files
set nobackup

" No write backup
set nowritebackup

" No swap file
set noswapfile

" Command history
set history=500

" Always show cursor
set ruler

" Show incomplete commands
set showcmd

" Incremental searching (search as you type)
set incsearch

" Highlight search matches
set hlsearch

" Ignore case in search
set smartcase

" Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase

" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window
" if you try and quit Vim while there are hidden buffers, you will raise an error:
" E162: No write since last change for buffer “a.txt”
set hidden

" Turn word wrap off
set nowrap

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces
set expandtab

" Set tab size in spaces (this is for manual indenting)
set tabstop=4

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=4

" Turn on line numbers
set number


set numberwidth=5 " Set number width
set scrolloff=5       " Leave 5 lines of buffer when scrolling
set sidescrolloff=10  " Leave 10 characters of horizontal buffer when scrolling

" Turn on relative line numbers
set relativenumber

" Highlight tailing whitespace
" See issue: https://github.com/Integralist/ProVim/issues/4
set list listchars=tab:\ \ ,trail:·

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
set laststatus=2

" Set the status line to something useful
" set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Hide the toolbar
set guioptions-=T

" UTF encoding
set encoding=utf-8

" Autoload files that have changed outside of vim
set autoread

" Use system clipboard
" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
set clipboard+=unnamed

" Don't show intro
set shortmess+=I

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Highlight the current line
set cursorline

" Ensure Vim doesn't beep at you every time you make a mistype
set visualbell

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" color the 80th column
set textwidth=80
set colorcolumn=+1
set ttyfast                           " Send more characters in fast terminals
set noerrorbells novisualbell         " Turn off visual and audible bells

" Use new regular expression engine
" https://jameschambers.co.uk/vim-typescript-slow
set re=0
"let g:deoplete#enable_at_startup = 1

" Unlimited memory for vim
set maxmempattern=2000000
