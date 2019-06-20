" Maintainer: Idigo Luwum
" Version: #ver
" License: This file is distributed under the terms of Gnu Public License Version 2
"""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""
" utf8 ftw!
set encoding=utf-8

" up to 500 lines of vim command history
set history=500

" enable mouse for all modes. 
set mouse=a

" load filetype specific highlighting and indentation
filetype plugin on
filetype indent on

set relativenumber
set ruler
set hlsearch
set incsearch
set noswapfile
set nobackup
set nowritebackup
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
" 2. Generate tags file with ctags -R -f ~/.local/share/ctags/systags /usr/include
" /usr/local/include
if empty(exepath('ctags'))
    echom ' Could not find ctags on the system.\n'
    \ ' Install univeral ctags at https://github.com/universal-ctags/ctags\n'
    \ ' Generate tags file with ctags -R -f <path_to_store_ctags> <include_path>...'
endif

set tags+=expand('~/.local/share/ctags/systags')

"""""""""""""""""""""""""""""""""""""""
" Plugins (via vim-plug)
"""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup plug_install
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

call plug#begin(expand('~/.local/share/nvim/plugged'))
    Plug 'tpope/vim-obsession'
    Plug 'dhruvasagar/vim-prosession'
    Plug 'tpope/vim-sensible'
    Plug 'w0rp/ale'
    Plug 'itchyny/lightline.vim'
    Plug 'SirVer/ultisnips'
    Plug 'maximbaz/lightline-ale'
    Plug 'tpope/vim-vinegar'
    Plug 'w0rp/ale'
    Plug 'supercollider/scvim'
    Plug 'daviesjamie/vim-base16-lightline'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-fugitive'
    Plug 'majutsushi/tagbar'
    Plug 'benmills/vimux'
    Plug 'nightsense/vimspectr'
    Plug 'Shougo/denite.nvim'
    Plug 'ervandew/supertab'
    Plug 'tpope/vim-surround'
    Plug 'hashivim/vim-vagrant'
    Plug 'lambdalisue/suda.vim'
    Plug 'mattn/emmet-vim'
    Plug 'othree/javascript-libraries-syntax.vim'
    Plug 'rust-lang/rust.vim'
    Plug 'honza/vim-snippets'
    Plug 'Valloric/YouCompleteMe'
    Plug 'wokalski/autocomplete-flow'
    Plug 'airblade/vim-gitgutter'
    Plug 'sebastianmarkow/deoplete-rust'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'sheerun/vim-polyglot'
    Plug 'chriskempson/base16-vim'
    Plug 'ryanoasis/vim-devicons'
call plug#end()

""""""""""""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""""""""""""
set noshowmode

if filereadable(expand('~/.vimrc_background'))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let g:lightline = {
      \ 'colorscheme': 'base16',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch' ],
      \             [ 'filename', 'modified', 'readonly' ] ],
      \   'right': [ [ 'lineinfo', 'linter_checking', 'linter_warnings', 'linter_errors', 'linter_ok' ],
      \              [ 'percent' ],
      \              [ 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component_expand' : {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok'
      \ },
      \ 'component_type' : {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
      \ }

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

"""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""

let g:mapleader = ','

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
nmap <leader>gd :Gdiff<cr>

nnoremap <leader>gg :GitGutterToggle<cr>
nnoremap <leader>gh :GitGutterLineHighlightsToggle<cr>
nnoremap <leader>ga :GitGutterStageHunk<cr>
nnoremap <leader>gu :GitGutterUndoHunk<cr>

nnoremap <leader>af :ALEFix<cr>
nnoremap <leader>ad :ALEDetail<cr>
nnoremap <leader>al :ALELint<cr>

nmap <leader>w :w!<cr>
nmap <leader>ws :split<cr>
nmap <leader>wv :vsplit<cr>

nmap <leader>tt :tabnew<cr>
nmap <leader>tn :tabnext<cr>
nmap <leader>tp :tabprevious<cr>

nmap <leader>b :Denite buffer<cr>
nmap <leader>f :Denite file<cr>
nmap <leader>h :Denite command_history<cr>
nmap <leader>j :YcmCompleter GoTo<cr>
nmap <leader>d :YcmCompleter GoToDefinition<cr>
nmap <leader>k :YcmCompleter GetType<cr>
nmap <leader>m :YcmCompleter GetDoc<cr>

nnoremap <F1> <silent>
nnoremap <F2> <silent>

" Quickly move between ALE errors.
nnoremap <F3> <Plug>(ale_previous_wrap)
nnoremap <F4> <Plug>(ale_next_wrap)

nnoremap <F5> <silent>
nnoremap <F6> <silent>
nnoremap <F7> :YcmCompleter 
nnoremap <F8> :YcmCompleter 
nnoremap <F9> :YcmCompleter GoTo
nnoremap <F10> :YcmCompleter 
nnoremap <F11> :YcmCompleter GoTo
nnoremap <F12> :YcmCompleter 

" Quickly move between ALE errors.
nnoremap <silent><C-S-k> <Plug>(ale_previous_wrap)
nnoremap <silent><C-S-j> <Plug>(ale_next_wrap)

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
let g:prosession_dir = $XDG_DATA_HOME . '/nvim/session/'

if !filewritable(g:prosession_dir)
   call mkdir(g:prosession_dir)
endif

" Do not create session for a vcs branch.
let g:prosession_per_branch = 0

" Command used to identify the current branch.
let g:prosession_branch_cmd = 'git rev-parse --abbrev-ref HEAD 2>/dev/null'

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
  \ 'c': [ 'clangd' ],
  \ 'cpp': [ 'clangtidy' ],
  \ 'sh': [ 'shellcheck' ],
  \ 'go': [ 'megacheck' ],
  \ 'javascript': [ 'standard' ],
  \ 'python': [ $WORKON_HOME . '/neovim/bin/flake8' ],
  \ 'rust' : [ 'clippy' ],
  \ 'vim' : [ 'vint' ],
  \ 'solidity': [ 'solium' ],
  \ }

" Fixers correct linter errors automagically!
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'c': [ 'clang-format' ],
  \ 'cpp': [ 'clang-format' ],
  \ 'sh' : [ 'shfmt' ],
  \ 'go' : [ 'gofmt' ],
  \ 'javascript': [ 'prettier_standard' ],
  \ 'python': [ 'yapf' ],
  \ 'rust': [ 'rustfmt']
  \ }

" Run ale upon saving a file.
let g:ale_lint_on_save = 1

" Do not run ale upon changes to the file.
let g:ale_lint_on_text_changed = 'never'

" Run ale after leaving insert mode.
let g:ale_lint_on_insert_leave = 1

"""""""""""""""""""""""""""""""""""""""
" Python
"""""""""""""""""""""""""""""""""""""""
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog =  '/usr/bin/python3'


"""""""""""""""""""""""""""""""""""""""
" Suda
"""""""""""""""""""""""""""""""""""""""
" Automagically switch a buffer name when the target file is not readable or writable.
let g:suda_smart_edit = 1
let g:suda#prefix = ['suda://', 'sudo://']


"""""""""""""""""""""""""""""""""""""""
" Denite
"""""""""""""""""""""""""""""""""""""""
augroup DeniteSettings
    autocmd!
    autocmd FileType denite call s:denite_my_settings()
    function! s:denite_my_settings() abort
      nnoremap <silent><buffer><expr> <CR>
      \ denite#do_map('do_action')
      nnoremap <silent><buffer><expr> d
      \ denite#do_map('do_action', 'delete')
      nnoremap <silent><buffer><expr> p
      \ denite#do_map('do_action', 'preview')
      nnoremap <silent><buffer><expr> q
      \ denite#do_map('quit')
      nnoremap <silent><buffer><expr> i
      \ denite#do_map('open_filter_buffer')
      nnoremap <silent><buffer><expr> <Space>
      \ denite#do_map('toggle_select').'j'
    endfunction
augroup END
