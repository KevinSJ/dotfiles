local M = require('utils')


vim.cmd('command! -nargs=0 Format :call CocAction(\'format\') ')
vim.cmd('command! -nargs=0 OR :call CocAction(\'runCommand\', \'editor.action.organizeImport\')')

vim.cmd[[
    highlight clear SignColumn
    highlight Comment cterm=italic gui=italic
    highlight TechWordsToAvoid ctermbg=red ctermfg=white
]]

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

M.autocmd('FilterWritePre', 'call SetDiffColors()')

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


--vim.cmd[[
    --command! -nargs=0 Ns call Newscratch()
    --fun! Newscratch()
      --execute 'tabnew '
      --setlocal buftype=nofile
      --setlocal bufhidden=hide
      --setlocal noswapfile
    --endfun
--]]

function new_scratch()
    vim.api.nvim_command('tabnew')
    --[[
    [Parameters:
    [{listed} Sets 'buflisted'
    [{scratch} Creates a "throwaway" scratch-buffer for temporary work (always 'nomodified'). Also sets 'nomodeline' on the buffer.
    ]]
    vim.api.nvim_create_buf(false, true)
    vim.opt_local.buftype = 'nofile'
    vim.opt_local.bufhidden = 'hide'
    vim.opt_local.swapfile = false
    M.mapBuf(vim.api.nvim_get_current_buf(), 'n', '<leader>s', ':file note_' .. os.time() ..'| set buftype= swapfile | w <cr>')
    M.mapBuf(vim.api.nvim_get_current_buf(), 'n', ',ff', ':%!jq . <cr><bar>:setf json')
end

function preview()

end

function node_execute(command)
    local bnr = vim.fn.bufnr('%')
    local ns_id = vim.api.nvim_create_namespace('demo')

    local selected = (vim.fn.getline('.'))
    local handle

    if command == 'js' then
        handle = io.popen("node -e '" .. selected .. "'")
    end

    if command == 'py' then
        handle = io.popen("python -c '" .. selected .. "'")
    end

    if command == 'rb' then
        handle = io.popen("ruby -c '" .. selected .. "'")
    end

    --local handle = io.popen("node -e '" .. selected .. "'")
    local result = handle:read("*a")
    result = result:gsub("%s+", "")

    local col_num,line_num = unpack(vim.fn.getpos('v'))

    local opts = {
        id = 1,
        virt_text = {{result, "IncSearch"}},
        virt_text_pos = 'right_align',
    }
    vim.api.nvim_buf_set_extmark(bnr, ns_id, line_num -1, col_num, opts)
    --vim.api.nvim_command('o')

    --vim.cmd("normal o")
    --vim.api.nvim_buf_set_lines(cur_buf, line_end + 1, line_end + 1, false, { result })
end


-- Always highlight column 80 so it's easier to see where
-- cutoff appears on longer screens
--autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
M.autocmd('BufWinEnter', 'highlight ColorColumn ctermbg=darkred', nil)

-- Map double Esc to wipebuffer in terminals
M.autocmd('TermOpen', 'nmap <buffer><silent> <Esc><Esc> :bd!<cr>', nil)


--Open NERDTree if start with no args
--autocmd VimEnter * if !argc() | NERDTree | endif
M.autocmd('VimEnter', 'if !argc() | NERDTree | endif', nil)

M.autocmd('CursorHold', 'silent call CocActionAsync(\'highlight\')')
M.autocmd({'BufEnter'}, ':set filetype=markdown', {"*.md"})

-- TODO:  <27-07-22, yourname> convert this to lua func --
-- This help execute the js without leaving the buffer
M.autocmd({'Filetype'}, 'nmap <buffer><silent> ,js :lua node_execute(\'js\')<cr>', {"markdown"})
M.autocmd({'Filetype'}, 'nmap <buffer><silent> ,py :lua node_execute(\'py\')<cr>', {"markdown"})
M.autocmd({'Filetype'}, 'nmap <buffer><silent> ,rb :lua node_execute(\'rb\')<cr>', {"markdown"})
--M.autocmd({'Filetype'}, 'vmap <buffer><silent> ,py :put=system(\'python\', getline(\'.\')) <cr>', {"markdown"})
--M.autocmd({'BufEnter'}, ':!pandoc %:S --to plain -o %:S', {"*.docx", "*.doc"})
M.autocmd({'BufEnter'}, ':!pandoc #:S --to plain -o -', {"*.docx", "*.doc"})
--M.autocmd({'Filetype'}, 'nmap <buffer><silent> ,v :call Newscratch() | r !pdftotext -eol unix #:S -', {"*.pdf"})
M.autocmd({'BufEnter'}, ':vnew |r !pdftotext -eol unix #:S -', {"*.pdf"})
--M.autocmd({'BufEnter'}, ':vnew |r !pdftotext -eol unix #:S -', {"*.pdf"})
