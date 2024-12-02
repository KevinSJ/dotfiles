map <buffer> <silent> <nowait> <Leader>rt :Rt<CR>
" update test snapshots
map <buffer> <silent> <nowait> <Leader>ru :Rt -u<CR>
map <buffer> <silent> <nowait> <Leader>rw :Rt --watch<CR>
" find the coresponding test file
map <leader>F :NERDTreeFind<CR>
map <leader>T :Ft<CR>

"if exists('*FindSnap')
    "finish
"endif
"command! -nargs=? Ft call FindSnap(<q-args>)
"fun! FindTest(...)
  "set path+=**

  "let fileName = expand('%:t:r') . '.test.ts.nap'
  "execute 'tabnew '
  "execute 'find '. fileName
  "execute 'split term://yarn test '. fileName . ' --watch'
"endfun


if exists('*FindTest')
    finish
endif
command! -nargs=? Ft call FindTest(<q-args>)
fun! FindTest(...)
  set path+=**

  let fileName = expand('%:t:r') . '.test.ts'
  execute 'tabnew '
  execute 'find '. fileName
  execute 'sp term://yarn test '. fileName . ' --watch'
endfun

command! -nargs=? Rt call RunTest(<q-args>)
fun! RunTest(...)
  if a:0 > 0
    execute 'split term://yarn test % '. a:1
  else
    execute 'split term://yarn test %'
  endif
endfun
