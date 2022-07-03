function show_documentation()
   local filetype = vim.bo.filetype

   if filetype == 'vim'  or filetype == 'help' then
        vim.api.nvim_command('h ' .. filetype)

    elseif vim.call('coc#rpc#ready') then
      vim.fn.CocActionAsync('doHover')
    end
end
