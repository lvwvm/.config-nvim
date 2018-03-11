"""""""""""""""""""""""""""""""""""""""
"
"  Maintainer: Idigo Luwum
"  Version: 0.1.5
"
"""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""
" utf8 ftw!
set encoding=utf8

" up to 500 lines of vim command history
set history=500

" load filetype specific highlighting and indentation
filetype plugin on
filetype indent on

set relativenumber
set ruler
set hlsearch
set incsearch
set noswapfile
set nobackup
set nowb
set autoread

""""""""""""""""""""""""""""""""""""""""
" Tabs, Spaces, Folds
""""""""""""""""""""""""""""""""""""""""
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set foldcolumn=1

""""""""""""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""""""""""""
let g:airline_theme="wombat"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
try
    colorscheme elflord
catch
endtry

"""""""""""""""""""""""""""""""""""""""
" Plugins (via vim-plug)
"""""""""""""""""""""""""""""""""""""""
call plug#begin("~/.local/share/nvim/plugged")
    Plug 'tpope/vim-obsession'
    Plug 'dhruvasagar/vim-prosession'
    Plug 'tpope/vim-sensible'
    Plug 'bling/vim-airline'
    Plug 'w0rp/ale'
    Plug 'edkolev/tmuxline.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-fugitive'
    Plug 'majutsushi/tagbar'
    Plug 'benmills/vimux'
    Plug 'Shougo/neco-syntax'
    Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'tweekmonster/deoplete-clang2'
    Plug 'ervandew/supertab'
    Plug 'hashivim/vim-vagrant'
    Plug 'mattn/emmet-vim'
    Plug 'othree/javascript-libraries-syntax.vim'
    Plug 'Shougo/neco-syntax'
    Plug 'wokalski/autocomplete-flow'
    Plug 'Shougo/neosnippet'
    Plug 'airblade/vim-gitgutter'
    Plug 'Shougo/neosnippet-snippets'
call plug#end()

"""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""

let mapleader = ","
let g:mapleader = ","

" Simple Window Movement
nmap <c-j> <c-w>j
nmap <c-h> <c-w>h
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

"""""""""""""""""""""""""""""""""""""""
" Normal Mode
"""""""""""""""""""""""""""""""""""""""

nmap <leader>w :w!<cr>
nmap tt :tabnext<cr>
nmap TT :tabprevious<cr>
nmap <leader>b :Denite buffer<cr>
nmap <leader>f :Denite file<cr>

" Disable the arrow keys
nnoremap <Down> <NOP>
nnoremap <Up> <NOP>
nnoremap <Right> <NOP>
nnoremap <Left> <NOP>

"""""""""""""""""""""""""""""""""""""""
" Insert Mode
"""""""""""""""""""""""""""""""""""""""

"Leader-q to Escape from insert mode.
inoremap <leader>q <ESC>

"""""""""""""""""""""""""""""""""""""""
" Ale
"""""""""""""""""""""""""""""""""""""""
" Do not keep the sign gutter open at all time.
let g:ale_sign_column_always = 0

" Display errors and warnings in the statusline
let g:airline#extensions#ale#enabled = 1

" Run ale after every modifcation
let g:ale_lint_on_text_changed = 'normal'

" Set delay time
let g:ale_lint_delay = 200

" Run ale upon opening a file.
let g:ale_lint_on_enter = 1

"""""""""""""""""""""""""""""""""""""""
" Deoplete
"""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

" Clang source locations
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang' 

"""""""""""""""""""""""""""""""""""""""
" Python
"""""""""""""""""""""""""""""""""""""""
let g:python_host_prog = '/home/luwum/.local/share/virtualenvs/neovim2/bin/python'
let g:python3_host_prog = '/home/luwum/.local/share/virtualenvs/neovim/bin/python'
