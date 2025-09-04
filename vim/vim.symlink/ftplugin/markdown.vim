:Copilot disable
imap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
"inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
"vim.keymap.set("n", "<leader>ss", <c-g>u<Esc>[s1z=`]a<c-g>u)


:hi clear SpellBad
:hi SpellBad gui=undercurl guifg=Red
:hi SpellCap gui=undercurl guifg=Blue
:hi SpellLocal gui=undercurl guifg=Green
:hi SpellRare gui=undercurl guifg=Purple
:setlocal spell spelllang=en_nz
:setlocal textwidth=80
:setlocal formatoptions+=t
:setlocal formatoptions+=c
:setlocal complete+=spell
