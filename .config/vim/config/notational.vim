" Prevent fzf creating new tabs or fidgeting about with NerdTree buffers
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"

function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

nnoremap <silent> <C-b> :call FZFOpen(':Buffers')<CR>
nnoremap <silent> <C-g>g :call FZFOpen(':Ag')<CR>
nnoremap <silent> <C-g>c :call FZFOpen(':Commands')<CR>
nnoremap <silent> <C-g>l :call FZFOpen(':BLines')<CR>
"nnoremap <silent> <C-p> :call FZFOpen(':files')<CR>
" End of tab prevention


"nnoremap
nnoremap <C-n> :Goyo!<cr>:<C-u>NV!<cr>
let g:nv_search_paths = ['~/Notes']
let g:nv_preview_direction = 'right'
let g:nv_create_note_window = 'edit'
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_frontmatter = 1
let g:nv_use_short_pathnames = 1
let g:nv_create_note_key = 'ctrl-n'
