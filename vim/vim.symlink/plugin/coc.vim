"let g:coc_node_path = '~/.nvm/versions/node/v14.16.1/bin/node'
let g:coc_node_path = $(which node)
let g:coc_global_extensions = [ 'coc-snippets', 'coc-tsserver', 'coc-tslint-plugin', 'coc-css', 'coc-json', 'coc-stylelint', 'coc-styled-components', 'coc-java', 'coc-docthis']
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
 vmap <C-j> <Plug>(coc-snippets-select)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
