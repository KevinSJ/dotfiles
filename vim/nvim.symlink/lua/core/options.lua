-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)
local home = os.getenv('HOME')

g.mapleader = ' '  -- Change leader to space
opt.undodir = home .. '/.vim/undo'
opt.undofile = true
opt.undolevels = 1000
opt.undoreload = 10000
opt.updatetime = 300


-- Ignored files/directories from autocomplete (and CtrlP)
opt.wildmode = 'longest:full,list,full'
opt.wildignore:append '*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,*.pyc'
opt.wildignore:append '*.swp,*~,*/.DS_Store'
opt.wildignore:append '*/vendor/bundle/*'
opt.wildignore:append '*/node_modules/*'
opt.wildignore:append '*/build/*'
opt.wildignore:append '*/out/*'

-- Leave 10 characters of horizontal buffer when scrolling
vim.opt.sidescrolloff=10

vim.opt.backupcopy = 'yes' -- overwrite files to update, instead of renaming + rewriting
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.backupdir = string.format('%s%s', vim.fn.stdpath 'data', '/backup//') -- keep backup files out of the way
vim.opt.backupdir:append '.'

-----------------------------------------------------------
-- General
-----------------------------------------------------------
-- UTF encoding
vim.opt.encoding="utf-8"
-- Autoload files that have changed outside of vim
vim.opt.autoread = true
opt.mouse = 'a'                       -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.swapfile = false                  -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options
opt.compatible = false -- Use vim, not vi api


-- No swap file
vim.opt.swapfile = false

-- Always show cursor
vim.opt.ruler = true

-- Show incomplete commands
vim.opt.showcmd = true

-- Command history
vim.opt.history=500

-- Highlight search matches
vim.opt.hlsearch = true

-- Ignore case in search
vim.opt.smartcase = true

-- Make sure any searches /searchPhrase doesn't need the \c escape character
vim.opt.ignorecase = true

-- Turn word wrap off
vim.opt.wrap = false

---
--- Display
---
opt.list = true -- Show some invisible characters
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

-- Set number width
vim.opt.numberwidth=5

-- Leave 5 lines of buffer when scrolling
vim.opt.scrolloff=5

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true           -- Show line number
opt.relativenumber = true   -- Show relative line numbers
opt.showmatch = true        -- Highlight matching parenthesis
opt.foldmethod = 'marker'   -- Enable folding (default 'foldmarker')
opt.colorcolumn = '80'      -- Line lenght marker at 80 columns
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.linebreak = true        -- Wrap on word boundary
opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.laststatus=3            -- Set global statusline

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 4          -- Shift 4 spaces when tab
opt.tabstop = 4             -- 1 tab == 4 spaces
opt.softtabstop = 4         -- Number of spaces tabs count for in insert mode
opt.smartindent = true      -- Autoindent new lines
-- http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true           -- Enable background buffers
opt.history = 100           -- Remember N lines in history
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Max column for syntax highlight
opt.updatetime = 250        -- ms to wait for trigger an event

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
opt.shortmess:append "sI"

-- Disable builtin plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end

-- Better splits (new windows appear below and to the right)
vim.opt.splitbelow = true
 vim.opt.splitright = true


-- Ensure Vim doesn't beep at you every time you make a mistype
vim.opt.visualbell = true

-- Visual autocomplete for command menu (e.g. :e ~/path/to/file)
vim.opt.wildmenu = true

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
