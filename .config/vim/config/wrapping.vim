" Line wrapping and max width
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=100

augroup textwidth
    autocmd!
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd FileType markdown setlocal textwidth=10000
    autocmd FileType html.twig setlocal textwidth=0
    autocmd BufRead *.phtml,*.html,*.csv setlocal textwidth=0
augroup END
