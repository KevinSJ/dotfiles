nnoremap <silent> <buffer> ,xm :%!xmllint --format - <cr><bar>:setf html<bar>:set foldmethod=expr<bar>set foldexpr=nvim_treesitter#foldexpr()<bar>:redraw!<cr>
