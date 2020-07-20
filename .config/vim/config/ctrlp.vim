" [CTRL-P] ______________________________________
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_custom_ignore = 'node_modules\|bower_components'
"let g:ctrlp_max_files = 40000
let g:ctrlp_max_files = 0
let g:ctrlp_show_hidden = 1
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "" --ignore-dir bower_components --ignore-dir node_modules --ignore-dir .git'
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "" --ignore-dir bower_components --ignore-dir node_modules'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_use_caching = 1
