let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_toc_autofit = 1

" > Conceal level settings are set in indent.vim.

" _______________________________
" Auto-Save Markdown files
augroup autosave_md
    autocmd!
    autocmd BufEnter * silent let g:auto_save = 0
    autocmd BufEnter *.md silent let g:auto_save = 1
augroup end

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile *.md set filetype=markdown
"autocmd BufRead,BufEnter,BufNewFile,BufWinEnter *.md hi clear OverLength

"_______________________________________________________________________________

" Frontmatter / date macros
" Todo: in paste mode, this should first :set nopaste
nnoremap <A-D> :exec 'normal i'.system("~/Scripts/string/datestamp.sh \| tr '\r' ' '")<cr>i
inoremap <A-D> <C-R>=strftime("%Y%m%d")<cr>
nnoremap <A-F> :exec 'normal i'.system("~/Scripts/string/frontmatter.sh \| tr '\r' ' '")<cr>i
inoremap <A-F> <esc>$ :exec 'normal i'.system("~/Scripts/string/frontmatter.sh \| tr '\r' ' '")<cr>i

"_______________________________________________________________________________

" Horizontal ruler: underscores for H1 markdown headers
"   Trigger:    leader - (dash)
nnoremap <leader>- o<esc>80i_<esc>0<esc>

" Horizontal ruler: dashes for H2+ markdown headers
"   Trigger:    leader = (equals sign)
nnoremap <leader>= o<esc>80i-<esc>0<esc>

"_______________________________________________________________________________

" Code flag: 3 backticks
"   Trigger:    Alt c (for 'code') in insert mode
inoremap <M-c> ```
"   Trigger:    Alt c (for 'code') in normal mode
nnoremap <M-c> i```<esc>o<esc>

" Bash code flag: (```bash)
"   Trigger:    Alt b (for 'bash') in insert mode
inoremap <M-b> ```bash
"   Trigger:    Alt b (for 'bash') in normal mode
nnoremap <M-b> i```bash<esc>o<esc>

"_______________________________________________________________________________

" Auto switch goyo
function! s:switch_goyo()
    if &ft == 'markdown' && winnr('$') == 1
        Goyo
        "Goyo 80
        "set colorcolumn=
    elseif exists('#goyo')
        Goyo!
"        "set colorcolumn=+1
    endif
endfunction
nnoremap <Leader>g :call <SID>switch_goyo()<cr>
" ___________________________________________
"
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  "hi clear OverLength
  let g:indentLine_concealcursor = "nv"
  let g:indentLine_conceallevel = 2
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  "highlight clear OverLength
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Toggle table of contents
nnoremap <Leader>t :Toch<cr>

" Toggle conceallevel for links
function! ToggleConcealLevel()
    if &l:conceallevel == 0
        set conceallevel=2
        echom 'Concealed Markdown.'
    elseif &l:conceallevel == 2
        set conceallevel=0
        echom 'Revealed Markdown.'
    endif
endfunction
nnoremap <Leader>a :call ToggleConcealLevel()<cr>
