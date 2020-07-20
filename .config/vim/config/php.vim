" [PHP] ________________________________________
augroup phpfold
    au!
    au FileType php set foldenable
augroup END

" Method to create templates when creating a library file. 
function! PhpLibraryTemplate(path)
    let pos_from_lib=strridx(a:path, 'library') + strlen('library/')
    let pos_of_dot=strridx(a:path, '.')-1
    let path_from_lib=a:path[pos_from_lib : pos_of_dot]
    let classname=join(split(path_from_lib, '/'), '_')
    execute "normal! i<?php"
    execute "normal! Goclass ".classname." {"
    execute "normal! Go    "
    execute "normal! Go}"
    execute "normal! Gk"
endfunction
