nnoremap <Tab> :b#<cr>

" Shift-Tab cycles through buffers
" (Ctrl-Tab doesn't work in xterm)
nnoremap <S-Tab> :bNext<cr>

" Don't require saving during buffer switching
set hidden

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
