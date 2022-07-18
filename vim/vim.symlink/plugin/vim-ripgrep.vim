" bind K to search word under cursor
"nnoremap K :Telescope grep_string <C-R><C-W><CR>
nnoremap K :lua require('telescope.builtin').grep_string(<C-R><C-W>)<CR>

cnoreabbrev <expr> Ag ((getcmdtype() is# ':' && getcmdline() is# 'Ag')?('Rg'):('Ag'))
