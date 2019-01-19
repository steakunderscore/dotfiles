call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf' | Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'matze/vim-move'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

" language
Plug 'tpope/vim-markdown'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" colorschemes
Plug 'nanotech/jellybeans.vim'

call plug#end()
