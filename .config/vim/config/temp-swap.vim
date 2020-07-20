" [TEMP & SWAP] _______________________________
" store swp files all in the same place
set noswapfile
"set directory=~/.vimtmp/swapdir
"if filewritable(&directory) == 0 | call mkdir(&directory, "p") | endif  

set undodir=~/.vimtmp/undodir
