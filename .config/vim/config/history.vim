" [HISTORY] ____________________________________
" enable hidden files for undo files containing spaces
set hid

" persistent history
set history=1000
if exists("&undodir")
    set undodir=~/.vim/undodir
    if filewritable(&undodir) == 0 | call mkdir(&undodir, "p") | endif
    set undofile
endif

" return to last edit position when opening files 
autocmd BufReadPost *
 \ if line("'\"") > 0 && line("'\"") <= line("$") |
 \   exe "normal! g`\"" |
 \ endif

