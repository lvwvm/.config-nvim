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
" Ctags
""""""""""""""""""""""""""""""""""""""""
" Don't forget
" 1. Install univeral ctags at https://github.com/universal-ctags/ctags
" 2. Generate tags file with ctags -R -f ~/.config/nvim/systags /usr/include /usr/local/include
set tags+=~/.config/nvim/systags

""""""""""""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""""""""""""
let g:airline_theme="wombat"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
try
    colorscheme pablo
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
    Plug 'tpope/vim-surround'
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

nmap <leader>gr :Gread<cr> 
nmap <leader>gw :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>w :w!<cr>
nmap <leader>tn :tabnext<cr>
nmap <leader>tp :tabprevious<cr>
nmap <leader>b :Denite buffer<cr>
nmap <leader>f :Denite file<cr>
nmap <leader>h :Denite command_history<cr>

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
" Prosession / Obsession
"""""""""""""""""""""""""""""""""""""""

" Obsession invokes :mksession upon BufEnter and VimLeavePre
" autocommands. Prosession stores and manages the created sessions.

" Store all session files in XDG_DATA_HOME
let g:procession_dir = $XDG_DATA_HOME . '/nvim/session/'

" Create a session for the create vcs branch.
let g:procession_per_branch = 1

" Command used to identify the current branch.
let g:procession_branch_cmd = 'git rev-parse --abbrev-ref HEAD 2>/dev/null'

"""""""""""""""""""""""""""""""""""""""
" Ale
"""""""""""""""""""""""""""""""""""""""
" Do not keep the sign gutter open at all time.
let g:ale_sign_column_always = 0

" Display errors and warnings in the statusline
let g:airline#extensions#ale#enabled = 1

" Run ale upon opening a file.
let g:ale_lint_on_enter = 1

" Linters to use when running ale.
let g:ale_linters = {
  \ 'c': [ 'clang-tidy' ],
  \ 'cpp': [ 'clang-tidy' ],
  \ 'sh': [ 'shellcheck' ],
  \ 'go': [ 'megacheck' ],
  \ 'javascript': [ 'standard' ],
  \ 'python': [ $WORKON_HOME . '/neovim/bin/flake8' ],
  \ 'rust' : [ 'clippy' ],
  \ 'solidity': [ 'solium' ],
  \ }

" Fixers correct linter errors automagically!
let g:ale_fixers = {
  \ 'c': [ 'clangformat' ],
  \ 'cpp': [ 'clangformat' ],
  \ 'sh' : [ 'shfmt' ],
  \ 'go' : [ 'gofmt' ],
  \ 'javascript': [ 'prettier-standard' ],
  \ 'python': [ 'yapf' ],
  \ 'rust': [ 'rustfmt' ],
  \ 'vim': ['generic'],
  \ }

" Run ale upon saving a file.
let g:ale_lint_on_save = 1

" Do not run ale upon changes to the file.
let g:ale_lint_on_text_changed = 'never'

" Run ale after leaving insert mode. 
let g:ale_lint_on_insert_leave = 1

"""""""""""""""""""""""""""""""""""""""
" Deoplete
"""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

" There are 3 different completion types in vim.
" 1. omnifunc - a function that can be defined a user, filetype-specific
" completion
" 2. completefunc - a function that 
" 3. completefunc - a function that 
let g:deoplete#complete_method = 'complete'

" Clang source locations
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so' 
let g:deoplete#sources#clang#clang_header = '/usr/include/clang'

let g:deoplete#auto_complete_start_length = 3

"""""""""""""""""""""""""""""""""""""""
" Python
"""""""""""""""""""""""""""""""""""""""
let g:python_host_prog = '/home/luwum/.local/share/virtualenvs/neovim2/bin/python'
let g:python3_host_prog = '/home/luwum/.local/share/virtualenvs/neovim/bin/python'
