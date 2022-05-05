if empty(glob('~/.config/vim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/vim/plugged')

if has('nvim')
  Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
endif

Plug 'KeyboardFire/vim-minisnip'
Plug 'airblade/vim-gitgutter'
Plug 'benizi/vim-automkdir'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'matze/vim-move'
Plug 'mhartington/nvim-typescript'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pbrisbin/vim-restore-cursor'
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'trevordmiller/nova-vim'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'whatyouhide/vim-lengthmatters'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.config/fzf', 'do': './install --all' }
Plug 'Alok/notational-fzf-vim'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'Valloric/YouCompleteMe'
let g:ycm_python_binary_path = 'python'
" For centering / soft wrapping Markdown files:
Plug 'junegunn/goyo.vim'
" For tables in Markdown:
Plug 'godlygeek/tabular'
" For icons next to code files in file list mode
Plug 'ryanoasis/vim-devicons'
" For auto-saving Markdown files
Plug 'vim-scripts/vim-auto-save'
" Shows visual guidelines for indentation levels
Plug 'Yggdroot/indentLine'
Plug 'dracula/vim', { 'as': 'dracula' }
" Tidal Cycles, live music coding
Plug 'tidalcycles/vim-tidal'

call plug#end()
