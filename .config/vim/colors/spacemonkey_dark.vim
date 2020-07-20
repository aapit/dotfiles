" Vim color file
" Maintainer:   David Spreekmeester @aapit
" Last Change:  20200201

set background=dark
highlight clear
if exists("syntax on")
  syntax reset
endif

let g:colors_name = "spacemonkey_dark"

" For Vim to adhere to the tmux color scheme, `guibg` and `ctermbg` have to be `none`.
highlight Normal     term=none ctermfg=249          cterm=none  guifg=gray       gui=none
highlight Normal     ctermfg=none          ctermbg=none                     guibg=none
highlight Comment    term=none ctermfg=darkgrey     cterm=none  guifg=darkgrey   gui=none
highlight Constant   term=none ctermfg=darkyellow   cterm=none  guifg=blue       gui=none
highlight Special    term=none ctermfg=magenta           cterm=none  guifg=red        gui=bold
"highlight Special    term=none ctermfg=50           cterm=none  guifg=red        gui=bold
highlight Identifier term=none ctermfg=166          cterm=none  guifg=gray       gui=none
highlight Statement  term=none ctermfg=31           cterm=none  guifg=gray       gui=bold
highlight Operator   term=bold ctermfg=74           cterm=bold  guifg=gray       gui=bold
highlight PreProc    term=bold ctermfg=darkblue     cterm=none  guifg=green      gui=none
highlight Type       term=bold ctermfg=magenta      cterm=none  guifg=magenta    gui=none
highlight String     term=none ctermfg=69           cterm=none  guifg=blue       gui=none
highlight Number     term=none ctermfg=darkblue     cterm=none  guifg=darkblue   gui=none
highlight mkdHeading term=none ctermfg=31           cterm=none  guifg=darkblue   gui=none
highlight Title      term=none ctermfg=105          cterm=none  guifg=darkblue   gui=none

highlight LineNr     term=none ctermfg=60
"highlight clear OverLength
"highlight OverLength term=none ctermfg=15 ctermbg=none guibg=none
"highlight OverLength term=none ctermfg=15 ctermbg=none guibg=none
"augroup OverLength
"  autocmd BufEnter *.md hi OverLength ctermfg=none ctermbg=none guibg=none
"  autocmd BufEnter *.rb,*.py,*.py3,*.php,*.js,Makefile hi OverLength ctermfg=magenta ctermbg=none guibg=none
"  autocmd BufEnter *.rb,*.py,*.py3,*.php,*.js,Makefile match OverLength /\%80v.*/
"augroup END

hi NonText           term=none ctermbg=none guibg=none
"hi NonText           term=none ctermbg=235
hi ColorColumn       term=none ctermbg=none guibg=none
"hi ColorColumn       term=none ctermbg=234

let &colorcolumn=join(range(100,1000),",")


hi GitGutterAddInvisible ctermfg=242 ctermbg=13
hi GitGutterChangeInvisible ctermfg=242 ctermbg=13
hi GitGutterDeleteInvisible ctermfg=242 ctermbg=13
"hi GitGutterAddInvisible xxx ctermfg=242 ctermbg=242 guifg=bg guibg=Grey
"hi GitGutterChangeInvisible xxx ctermfg=242 ctermbg=242 guifg=bg guibg=Grey
"hi GitGutterDeleteInvisible xxx ctermfg=242 ctermbg=242 guifg=bg guibg=Grey
