map <buffer> <silent> <nowait> <Leader>rt :Rt<CR>

command! -nargs=? Rt call RunTest(<q-args>)
fun! RunTest(...)
  "let packageName=
  if a:0 > 0
    execute 'sp term://mvn -Dtest=%:t:r -Dsurefire.failIfNoSpecifiedTests=false test|:norm G'
  else
    execute 'sp term://mvn test|:norm G'
  endif
endfun


