vim.cmd('command! -nargs=0 Format :call CocAction(\'format\') ')
vim.cmd('command! -nargs=0 OR :call CocAction(\'runCommand\', \'editor.action.organizeImport\')')

--[[
    [Reset spelling colours when reading a new buffer
    [This works around an issue where the colorscheme is changed by .local.vimrc
    ]]
vim.cmd[[
    fun! SetSpellingColors()
      highlight SpellBad cterm=bold ctermfg=white ctermbg=red
      highlight SpellCap cterm=bold ctermfg=red ctermbg=white
    endfun

    autocmd BufWinEnter * call SetSpellingColors()
    autocmd BufNewFile * call SetSpellingColors()
    autocmd InsertEnter * call SetSpellingColors()
    autocmd InsertLeave * call SetSpellingColors()
]]


--[[
    [Change colourscheme when diffing
    ]]
vim.cmd[[
    fun! SetDiffColors()
      highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
      highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
      highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
      highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
    endfun
]]

vim.cmd[[
    fun! StripTrailingWhitespace()
      " don't strip on these filetypes
      if &ft =~ 'markdown'
        return
      endif
      %s/\s\+$//e
    endfun
    autocmd BufWritePre * call StripTrailingWhitespace()
]]

--[[
    [Create a 'scratch buffer' which is a temporary buffer Vim wont ask to save
    [http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
    ]]
vim.cmd[[
    command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
    fun! s:RunShellCommand(cmdline)
      echo a:cmdline
      let expanded_cmdline = a:cmdline
      for part in split(a:cmdline, ' ')
        if part[0] =~ '\v[%#<]'
          let expanded_part = fnameescape(expand(part))
          let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
        endif
      endfor
      botright new
      setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
      call setline(1, 'You entered:    ' . a:cmdline)
      call setline(2, 'Expanded Form:  ' .expanded_cmdline)
      call setline(3,substitute(getline(2),'.','=','g'))
      execute '$read !'. expanded_cmdline
      setlocal nomodifiable
      1
    endfunction
]]


vim.cmd[[
    command! -nargs=0 Ns call Newscratch()
    fun! Newscratch()
      execute 'tabnew '
      setlocal buftype=nofile
      setlocal bufhidden=hide
      setlocal noswapfile
    endfun
]]

function new_scratch()
    vim.api.nvim_create_buf()

end