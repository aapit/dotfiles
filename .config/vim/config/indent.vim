set conceallevel=2
set autoindent

augroup indent_md
    autocmd!
    autocmd BufEnter * silent let g:indentLine_conceallevel = 0
    autocmd BufEnter *.md silent let g:indentLine_conceallevel = 2
augroup end
