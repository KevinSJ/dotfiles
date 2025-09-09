-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: :h api-autocmd, :h augroup
-- https://neovim.io/doc/user/autocmd.html

local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-----------------------------------------------------------
-- General settings
-----------------------------------------------------------

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

-----------------------------------------------------------
-- Settings for filetypes
-----------------------------------------------------------

-- Disable line length marker
augroup('setLineLength', { clear = true })
autocmd('Filetype', {
  group = 'setLineLength',
  pattern = { 'text', 'markdown', 'html', 'xhtml', 'javascript', 'typescript' },
  command = 'setlocal cc=0'
})

-- Set indentation to 2 spaces
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript',
    'yaml', 'lua'
  },
  command = 'setlocal shiftwidth=2 tabstop=2'
})

augroup('spellchecker', {clear = true})
autocmd('Filetype', {
  group = 'spellchecker',
  pattern = { 'markdown' },
  command = [[
      hi clear SpellBad
      hi SpellBad gui=undercurl guifg=Red
      hi SpellCap gui=undercurl guifg=Blue
      hi SpellLocal gui=undercurl guifg=Green
      hi SpellRare gui=undercurl guifg=Purple
      setlocal spell spelllang=en_nz
      setlocal textwidth=80
      setlocal formatoptions+=t
      setlocal formatoptions+=c
      setlocal complete+=spell
  ]]
})


-- Define the command in Lua
vim.api.nvim_create_user_command("Rr", function(opts)
  vim.cmd("split term://hurl %")
end, { nargs = "?" })

-- Create an autocmd group
augroup('rr_group', {clear = true})

-- Buffer-local mapping set on FileType
vim.api.nvim_create_autocmd("FileType", {
  group = 'rr_group',
  pattern = { "hurl" }, -- or limit to a specific filetype, e.g. "http"
  callback = function(event)
    vim.keymap.set("n", "<Leader>rr", ":Rr<CR>", {
      buffer = event.buf,
      silent = true,
      nowait = true,
    })
  end,
})

augroup('format_on_save', { clear = true })
autocmd('BufWritePre', {
  group = 'format_on_save',
  pattern = { '*.go', '*.rs', '*.lua', '*.js', '*.ts', '*.jsx', '*.tsx' },
  command = 'silent! lua vim.lsp.buf.format({ async = false })'
})


-----------------------------------------------------------
-- Terminal settings
-----------------------------------------------------------

-- Open a Terminal on the right tab
autocmd('CmdlineEnter', {
  command = 'command! Term :botright vsplit term://$SHELL'
})

-- Enter insert mode when switching to terminal
autocmd('TermOpen', {
  command = 'setlocal listchars= nonumber norelativenumber nocursorline',
})

autocmd('TermOpen', {
  pattern = '',
  command = 'startinsert'
})

-- Close terminal buffer on process exit
autocmd('BufLeave', {
  pattern = 'term://*',
  command = 'stopinsert'
})
