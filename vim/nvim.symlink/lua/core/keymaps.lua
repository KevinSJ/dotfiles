-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

map('','<leader><leader>',':wincmd _ <cr> :wincmd | <cr>')

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')
-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration without restart nvim
--map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and w
map('n', '<leader>w', ':update<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('', '<leader>q', ':qa<CR>')
-- Use J and K to move current line up and down in visual
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "Q", "<nop>")
map("n", "<leader>f", 'lua vim.lsp.buf.format()')
--map('','<leader>f',':set foldmethod=expr <cr><bar>:set foldexpr=nvim_treesitter#foldexpr()<cr>')
map("x", "<leader>p", [["_dP]])
-- next greatest remap ever : asbjornHaland
map("n", "<leader>d", [["_d]])
map("v", "<leader>d", [["_d]])

map("n", "<leader>y", [["+y]])
map("v", "<leader>y", [["+y]])

map("n", "<leader>Y", [["+Y]])
map("v", "<leader>Y", [["+Y]])

--[[
   [map("n", "<leader><leader>", "", {
   [    callback = function()
   [        vim.cmd("so")
   [    end
   [})
   ]]

--vim.keymap.set("n", "<leader><leader>", function()
--    vim.cmd("so")
--end)


map('','<leader>;','<C-W>s') -- Horizontal split
map('','<leader>`','<C-W>v') -- Vertical split


map('','<leader>]','<C-W>s') -- Horizontal split
map('','<leader>[','<C-W>v') -- Vertical split
map('','<leader>=','<C-W>=') -- Horizontal split
map('','<Esc><Esc>',':q<cr>', {noremap = false, silent = true} )


for i = 1, 9 do
  local leader = '<Leader>' .. i
  local tab = ':' .. i .. 'tabn<cr>'
  map('n', leader, tab)
 end


-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true })  -- open
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit

-- NvimTree
map('n', '<leader>\'', ':NvimTreeToggle<CR>')            -- open/close
map('n', '<leader>F', ':NvimTreeFindFile<CR>')      -- search file


-- FZF
map('', '<C-p>', ':GFiles --exclude-standard --cached --others<CR>')
map('', '<leader>b', ':Buffers<CR>')
map('', '<leader>h', ':History<CR>')
map('', '<leader><tab>', ':FzfLua keymaps<CR>')


-- Tmux coexist
map('n', "<C-h>", ":NvimTmuxNavigateLeft<CR>", {silent = true})
map('n', "<C-j>", ":NvimTmuxNavigateDown<CR>", {silent = true})
map('n', "<C-k>", ":NvimTmuxNavigateUp<CR>", {silent = true})
map('n', "<C-l>", ":NvimTmuxNavigateRight<CR>", {silent = true})
map('n', "<C-\\>", ":NvimTmuxNavigateLastActive<CR>", {silent = true})
map('n', "<C-Space>", ":NvimTmuxNavigateNext<CR>", {silent = true})
