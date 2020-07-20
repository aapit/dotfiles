" [TABS vs SPACES] _____________________________
" tabs
set noet ci pi sts=0 sw=4 ts=4

" case-insensitive tab completion
set ignorecase
set infercase

" 4 space tabs, size of indent
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
set backspace=2

" a combination of spaces and tabs are used to simulate tab stops at
" a width other than the (hard)tabstop
set softtabstop=4
set scrolloff=3

" don't replace tabs in Makefiles, because they are required there.
autocmd FileType make setlocal noexpandtab
