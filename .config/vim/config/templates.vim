" [TEMPLATES] __________________________________
function! ModelConfigTemplate(path)
    execute "0read ".expand("$HOME/.vim/templates/model_config.json")
endfunction

augroup templates
    au!
    " read in templates files
    autocmd BufNewFile **/library/*.php :call PhpLibraryTemplate(expand('<afile>'))
    autocmd BufNewFile **/models/config/*.json :call ModelConfigTemplate(expand('<afile>'))
augroup END
