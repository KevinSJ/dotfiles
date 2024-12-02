local home    = os.getenv("HOME")


vim.g.loaded_gzip              = 1
vim.g.loaded_tar               = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_zip               = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_getscript         = 1
vim.g.loaded_getscriptPlugin   = 1
vim.g.loaded_vimball           = 1
vim.g.loaded_vimballPlugin     = 1
vim.g.loaded_matchit           = 1
vim.g.loaded_matchparen        = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_logiPat           = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_netrwSettings     = 1
vim.g.loaded_netrwFileHandlers = 1
-- TO BE MIGRATED TO SEPARATE FILE

-- Some settings copied from:
-- https://github.com/ahmedelgabri/dotfiles/blob/main/config/nvim/init.lua
-- Persistent undo
vim.opt.background = 'dark'
vim.opt.undodir = home .. '/.vim/undo'
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.opt.updatetime = 300

-- Ignored files/directories from autocomplete (and CtrlP)
vim.opt.wildmode = 'longest:full,list,full'
vim.opt.wildignore:append '*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,*.pyc'
vim.opt.wildignore:append '*.swp,*~,*/.DS_Store'
vim.opt.wildignore:append '*/vendor/bundle/*'
vim.opt.wildignore:append '*/node_modules/'

-- Use vim, not vi api
vim.opt.compatible = false

vim.opt.backupcopy = 'yes' -- overwrite files to update, instead of renaming + rewriting
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.backupdir = string.format('%s%s', vim.fn.stdpath 'data', '/backup//') -- keep backup files out of the way
vim.opt.backupdir:append '.'

-- No swap file
vim.opt.swapfile = false

-- Always show cursor
vim.opt.ruler = true

-- Show incomplete commands
vim.opt.showcmd = true

-- Command history
vim.opt.history=500

-- Always show cursor
vim.opt.ruler = true

-- Highlight search matches
vim.opt.hlsearch = true

-- Ignore case in search
vim.opt.smartcase = true

-- Make sure any searches /searchPhrase doesn't need the \c escape character
vim.opt.ignorecase = true

-- Turn word wrap off
vim.opt.wrap = false

-- Allow backspace to delete end of line, indent and start of line characters
vim.o.backspace = "indent,eol,start"

-- Convert tabs to spaces
vim.opt.expandtab = true

-- Set tab size in spaces (this is for manual indenting)
vim.opt.tabstop=4

-- The number of spaces inserted for a tab (used for auto indenting)
vim.opt.shiftwidth=4

-- Turn on line numbers
vim.opt.number = true

-- Set number width
vim.opt.numberwidth=5

-- Leave 5 lines of buffer when scrolling
vim.opt.scrolloff=5

-- Leave 10 characters of horizontal buffer when scrolling
vim.opt.sidescrolloff=10

-- Turn on relative line numbers
vim.opt.relativenumber = true

-- show trailing whitespace
vim.opt.list = true
vim.opt.listchars = {
  tab = '⋅ ',
  -- tab = '| ',
  nbsp = '░',
  extends = '»',
  precedes = '«',
  trail = '␣',
}
vim.opt.joinspaces = false
vim.opt.concealcursor = 'n'

-- http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0

-- Always show status bar
vim.opt.laststatus=2

-- Set the status line to something useful
-- set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)
vim.opt.statusline:prepend "%{coc#status()}%{get(b:,'coc_current_function','')}"

-- UTF encoding
vim.opt.encoding="utf-8"

-- Autoload files that have changed outside of vim
vim.opt.autoread = true

-- http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
vim.opt.clipboard:append 'unnamed'

-- Don't show intro
vim.opt.shortmess:append 'I'

-- Better splits (new windows appear below and to the right)
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Highlight the current line
vim.opt.cursorline = true

-- Ensure Vim doesn't beep at you every time you make a mistype
vim.opt.visualbell = true

-- Visual autocomplete for command menu (e.g. :e ~/path/to/file)
vim.opt.wildmenu = true

-- redraw only when we need to (i.e. don't redraw when executing a macro)
vim.opt.lazyredraw = true

-- highlight a matching [{()}] when cursor is placed on start/end character
vim.opt.showmatch = true

-- incremental command live feedback"
vim.opt.inccommand = 'nosplit'

-- cursor behavior:
--   - no blinking in normal/visual mode
--   - blinking in insert-mode
vim.opt.guicursor:append 'n-v-c:blinkon0,i-ci:ver25-Cursor/lCursor-blinkwait30-blinkoff100-blinkon100'

-- Make sure diffs are always opened in vertical splits, also match my git settings
vim.opt.diffopt:append 'vertical,algorithm:histogram,indent-heuristic,hiddenoff'

vim.opt.title = true

-- highlight matching [{()}]
vim.opt.showmatch = true

vim.opt.textwidth = 80
vim.opt.wrap = false
vim.opt.signcolumn = 'yes'
vim.opt.ttyfast = true
vim.opt.errorbells = false
vim.opt.visualbell = false

-- Use new regular expression engine
-- https://jameschambers.co.uk/vim-typescript-slow
vim.opt.re = 0

vim.opt.maxmempattern = 2000000

-- start highlighting from 256 lines backwards
vim.cmd 'syntax sync minlines=256'
-- do not highlight very long lines
vim.opt.synmaxcol = 300

-- Don't Display the mode you're in. since it's already shown on the statusline
vim.opt.showmode = false

-- use guifg/guibg instead of ctermfg/ctermbg in terminal
vim.opt.termguicolors = true
