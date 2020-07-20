" [KEY MAPPING] _______________________________
let mapleader = " "

" Semicolon leader instead of colon
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Edit whole string with c'
" onoremap ' i'
" onoremap " i"


" Close buffer shortcut
nnoremap <leader>x :bw<cr>

" Open current file in external editor (GhostWriter)
nnoremap <A-o> :!/snap/bin/ghostwriter-casept.ghostwriter "%" 2>/dev/null &<cr><cr>

" Copy-paste with system clipboard (Alt-y and Alt-p)
vnoremap <A-y> "+y
xnoremap <A-y> "+y
nnoremap <A-p> "+p
inoremap <A-p> <esc>"+pA
