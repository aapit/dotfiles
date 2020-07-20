" [STATUSBAR] _________________________________
" Powerline
"silent! python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup

" Status bar generic
set laststatus=2
"set cmdheight=1
set showmode
set showcmd
"set statusline=%f\ %y\ %m\ %r\ Line:\ %l/%L\ Col:\ %c\ Buf:\ #%n

" Enable vim-airline support for Powerline fonts
"let g:airline_powerline_fonts = 1
" Set theme for vim-airline
"let g:airline_theme='deus'
"

hi User1 ctermbg=red ctermfg=146
"hi User1 ctermbg=13 ctermfg=146
"hi User1 ctermbg=61 ctermfg=146
hi User2 ctermbg=97 ctermfg=104
hi User3 ctermbg=61  ctermfg=105

set statusline=
set statusline+=%1*  "switch to User1 highlight
set statusline+=\ %t\       "tail of the filename
set statusline+=%2*  "switch to User2 highlight
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%3*  "switch to User3 highlight
set statusline+=%=      "left/right separator
set statusline+=c:%c\      "cursor column
set statusline+=r:%l/%L   "cursor line/total lines
set statusline+=\ %P\     "percent through file
set statusline+=%*   "switch back to statusline highlight

"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
