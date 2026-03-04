vim.api.nvim_create_user_command('Ns', function()
  vim.cmd('tabnew')

  local opts = { silent = true, buffer = true }

  -- Format as JSON with treesitter folding
  local json_cmd =
  ':%!jq . <CR>|:setf json|set foldmethod=expr|set foldexpr=nvim_treesitter#foldexpr()|:redraw!|:foldopen<CR>'
  vim.keymap.set('n', '<Leader>ff', json_cmd, opts)
  vim.keymap.set('n', ',ff', json_cmd, opts)

  -- Format as XML with treesitter folding
  vim.keymap.set('n', ',xm',
    ':%!xmllint --format - <CR>|:setf html|:set foldmethod=expr|set foldexpr=nvim_treesitter#foldexpr()|:redraw!<CR>',
    opts)

  -- Save as scratch file
  vim.keymap.set('n', ',s', function()
    local ft = vim.bo.filetype
    local ext = ft ~= '' and ('.' .. ft) or ''
    vim.cmd('file scratch_' .. os.time() .. ext)
    vim.cmd('set buftype= swapfile')
    vim.cmd('w')
  end, opts)

  -- Save as note file
  vim.keymap.set('n', ',n', function()
    local ft = vim.bo.filetype
    local ext = ft ~= '' and ('.' .. ft) or ''
    vim.cmd('file ~/notes/note_' .. os.time() .. ext)
    vim.cmd('set buftype= swapfile')
    vim.cmd('w')
  end, opts)

  -- Base64 decode selection
  vim.keymap.set('v', ',dc', ':!base64 -d <CR>', opts)

  -- Buffer settings
  vim.bo.buftype   = 'nofile'
  vim.bo.bufhidden = 'hide'
  vim.bo.swapfile  = false
  vim.wo.wrap      = true
end, { nargs = 0 })
