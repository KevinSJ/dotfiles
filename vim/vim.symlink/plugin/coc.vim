"let g:coc_node_path = '~/.nvm/versions/node/v14.16.1/bin/node'
let g:coc_global_extensions = [ 'coc-snippets', 'coc-tsserver', 'coc-tslint-plugin', 'coc-css', 'coc-json', 'coc-stylelint', 'coc-styled-components', 'coc-java', 'coc-docthis']
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

nmap <leader>ff <Plug>(coc-codeaction-selected)<cr>
vmap <leader>ff <Plug>(coc-codeaction-selected)<cr>
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gx :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gD :call CocAction('jumpDefinition', 'drop')<CR>
"nmap <silent> gs :call CocAction('jumpDefinition', 'drop')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)




" Conflict with other plugin
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <cr> coc#pum#visible() && coc#pum#info()['index'] != -1 ? coc#pum#confirm() :
        \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
      "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
