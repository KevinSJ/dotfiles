"let g:coc_node_path = '~/.nvm/versions/node/v14.16.1/bin/node'
let g:coc_global_extensions = [ 'coc-snippets', 'coc-tsserver', 'coc-tslint-plugin', 'coc-css', 'coc-json', 'coc-stylelint', 'coc-styled-components', 'coc-java', 'coc-docthis']
let g:jsx_ext_required = 0
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = "floating"
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
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <unique><silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
