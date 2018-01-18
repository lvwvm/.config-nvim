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
setlocal smarttab
setlocal foldcolumn=1
setlocal expandtab
setlocal shiftwidth=4
setlocal tabstop=4

""""""""""""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""""""""""""
let g:airline_theme="wombat"
try
    colorscheme elflord
catch
endtry

"""""""""""""""""""""""""""""""""""""""
" Plugins (via vim-plug)
"""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'valloric/youcompleteme'
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'edkolev/tmuxline.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'benmills/vimux'
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

" Disable the arrow keys
nnoremap <Down> <NOP>
nnoremap <Up> <NOP>
nnoremap <Right> <NOP>
nnoremap <Left> <NOP>

"""""""""""""""""""""""""""""""""""""""
" Insert Mode 
"""""""""""""""""""""""""""""""""""""""

"Double tap q to Escape.
inoremap qq <ESC>
