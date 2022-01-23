local vim = vim
local api = vim.api
local M = {}

function M.map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.mapBuf(buf, mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  api.nvim_buf_set_keymap(buf, mode, lhs, rhs, options)
end

-- Change leader key from \ to space.
M.map('','<Space>','<leader>')
M.map('', '<leader>w', ':update<cr>')
M.map('', '<leader>q', ':qall<cr>')
M.map('', '<leader>gs', ':Gstatus<cr>')
M.map('','<leader>yd ',' :bufdo bd<cr>')
M.map('','<leader>;','<C-W>s') -- Horizontal split
M.map('','<leader>`','<C-W>v') -- Vertical split
-- List buffers
M.map('','<leader>yt',':ls<cr>')

M.map('n', 'gd', '<Plug>(coc-definition)')
M.map('n', 'gy', '<Plug>(coc-type-definition)')
M.map('n', 'gi', '<Plug>(coc-implementation)')
M.map('n', 'gr', '<Plug>(coc-references)')

M.map('v', '<C-r>', '"hy:%s/<C-r>h//g<left><left>')

M.map('','<leader>e',':Tabularize /=<cr>')
M.map('','<leader>c',':Tabularize /:<cr>')
M.map('','<leader>es',':Tabularize /=\zs<cr>')
M.map('','<leader>cs',':Tabularize /:\zs<cr>')

M.map('n','§',':nohlsearch<cr>' )

M.map('c','w!!','%!sudo tee > /dev/null %' )



for i = 1, 9 do
  local leader = '<Leader>' .. i
  local tab = ':' .. i .. 'tabn<cr>'
  M.map('n', leader, tab)
end


return M
