require('pluginconfig/coc-config')
require('commands')
local M = require('utils')


-- Change leader key from \ to space.
M.map('','<Space>','<leader>')
M.map('','<leader>w',':update<cr>')
M.map('','<leader>q',':qall<cr>')
M.map('','<leader>gs',':Git<cr>')
M.map('','<leader>yd',':bufdo bd<cr>')
M.map('','<leader>;','<C-W>s') -- Horizontal split
M.map('','<leader>`','<C-W>v') -- Vertical split
M.map('','<leader>]','<C-W>s') -- Horizontal split
M.map('','<leader>[','<C-W>v') -- Vertical split
M.map('','<leader>=','<C-W>=') -- Horizontal split
M.map('','<leader><space>',':wincmd _ <cr> :wincmd | <cr>') -- maximize width and height
M.map('','<leader>yt',':ls<cr>')
M.map('','<leader>e',':Tabularize /=<cr>')
M.map('','<leader>c',':Tabularize /:<cr>')
M.map('','<leader>es',':Tabularize /=\zs<cr>')
M.map('','<leader>cs',':Tabularize /:\zs<cr>')
M.map('','<Esc><Esc>',':q<cr>', {noremap = false, silent = true} )

M.map('n','<leader>k',':lua show_documentation()<CR>')
M.map('n','<leader>n',':lua new_scratch()<CR>')
M.map('n','gd','<Plug>(coc-definition)',{noremap = false, silent = true})
M.map('n','gy','<Plug>(coc-type-definition)',{noremap = false, silent = true})
M.map('n','gi','<Plug>(coc-implementation)',{noremap = false, silent = true})
M.map('n','gr','<Plug>(coc-references)',{noremap = false, silent = true})
M.map('n','§',':nohlsearch<cr>' )

M.map('v','<C-r>','"hy:%s/<C-r>h//g<left><left>')

M.map('c','w!!','%!sudo tee > /dev/null %' )

M.map('t','<Esc>','<C-\\><C-n>' )

for i = 1, 9 do
  local leader = '<Leader>' .. i
  local tab = ':' .. i .. 'tabn<cr>'
  M.map('n', leader, tab)
end

