map <buffer> <silent> <nowait> <Leader>rr :Rr<CR>

command! -nargs=? Rr call Execute(<q-args>)
fun! Execute(...)
    execute 'split term://hurl %'
endfun
