" [GARP] _______________________________________
augroup haconfig
    autocmd!
    autocmd BufWritePost /media/data2/Remotes/domo/*.yaml silent! execute "!make up >/dev/null 2>&1" | redraw!
augroup END
