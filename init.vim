" Maintainer: Idigo Luwum
" Version: #ver
" License: This file is placed under the terms of Gnu Public License Version 2
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
" 2. Generate tags file with ctags -R -f ~/.config/nvim/systags /usr/include /usr/local/include
set tags +=~/.config/nvim/systags

"""""""""""""""""""""""""""""""""""""""
" Plugins (via vim-plug)
"""""""""""""""""""""""""""""""""""""""
call plug#begin(expand('~/.local/share/nvim/plugged'))
    Plug 'tpope/vim-obsession'
    Plug 'dhruvasagar/vim-prosession'
    Plug 'tpope/vim-sensible'
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-vinegar'
    Plug 'w0rp/ale'
    Plug 'daviesjamie/vim-base16-lightline'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-fugitive'
    Plug 'majutsushi/tagbar'
    Plug 'benmills/vimux'
    Plug 'nightsense/vimspectr'
    Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'tweekmonster/deoplete-clang2'
    Plug 'ervandew/supertab'
    Plug 'tpope/vim-surround'
    Plug 'nixprime/cpsm'
    Plug 'hashivim/vim-vagrant'
    Plug 'mattn/emmet-vim'
    Plug 'othree/javascript-libraries-syntax.vim'
    Plug 'rust-lang/rust.vim'
    Plug 'honza/vim-snippet'
    Plug 'Shougo/neco-syntax'
    Plug 'wokalski/autocomplete-flow'
    Plug 'Shougo/neosnippet'
    Plug 'airblade/vim-gitgutter'
    Plug 'sebastianmarkow/deoplete-rust'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'sheerun/vim-polyglot'
    Plug 'chriskempson/base16-vim'
call plug#end()

""""""""""""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""""""""""""
set noshowmode

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let g:lightline = {
      \ 'colorscheme': 'base16',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch' ],
      \             [ 'filename', 'modified', 'readonly' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ }
      \ }

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

nmap <leader>w :w!<cr>
nmap <leader>ws :split<cr>
nmap <leader>wv :vsplit<cr>

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

"SuperTab neosnippet behavior
inoremap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

snoremap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

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
  \ 'c': [ 'clangtidy' ],
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
  \ 'c': [ 'clangformat' ],
  \ 'cpp': [ 'clangformat' ],
  \ 'sh' : [ 'shfmt' ],
  \ 'go' : [ 'gofmt' ],
  \ 'javascript': [ 'prettier_standard' ],
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

" These are general completion options for vim.
" menu - use a popup menu to show the possible completions
" menuone - use the pop menu when there is only one match
" preview - show extra information about the currently selected completion.
" longest - only insert the longest common text of the matches.
" noinsert - do not insert any text for a match until the user selects a match
" noselect - do not select a match in the menu, force the user to select one.
set completeopt="menu,menuone,longest,preview"

let g:deoplete#enable_at_startup = 1

" There are 3 different completion types in vim.
" 1. complete - uses the builtin complete() function.
" 2. completefunc - uses a user defined function for completion.
" 3. omnicomplete - uses a filetype-specific function for completion.
call deoplete#custom#option('complete_method', 'completefunc')

" Set specific source file options
call deoplete#custom#source('_', 'matchers', ['matcher_cpsm'])
call deoplete#custom#source('_', 'disabled_syntaxes', ['Commnent', 'String'])
call deoplete#custom#source('_', 'sorters', [] )
call deoplete#custom#source('_', 'converters', ['converter_remove_overlap',
            \ 'converter_auto_delimiter', 'converter_auto_paren',
            \ 'converter_truncate_menu', 'converter_truncate_abbr'])

" Clang source locations
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang'

let g:deoplete#auto_complete_start_length = 3

"""""""""""""""""""""""""""""""""""""""""
" Rust
"""""""""""""""""""""""""""""""""""""""""
let g:deoplete#sources#rust#racer_binary = $CARGO_HOME . '/bin/racer'
let g:deoplete#sources#rust#rust_source_path = $XDG_DATA_HOME . '/zsh/plugins/asdf-vm/asdf/installs/rust/stable/bin/rust'
let g:deoplete#sources#rust#show_duplicates = 0

"""""""""""""""""""""""""""""""""""""""
" Python
"""""""""""""""""""""""""""""""""""""""
let g:python_host_prog = $XDG_DATA_HOME . '/virtualenvs/neovim2/bin/python'
let g:python3_host_prog = $XDG_DATA_HOME . '/virtualenvs/neovim/bin/python'

"""""""""""""""""""""""""""""""""""""""
" SuperTab
"""""""""""""""""""""""""""""""""""""""

let g:SuperTabMappingForward = "<c-space>"
let g:SuperTabMappingBackward = "<c-alt-space>"
let g:SuperMappingTabLiteral = "<tab>"
let g:SuperTabCompletionContexts = [ 's:ContextText', 's:ContextDiscover' ]
let g:SuperTabContextDiscoverDiscovery =
  \  [ "&completefunc: <c-x><c-u>", "&omnifunc:<c-x><c-o>" ]

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabLongestEnhanced = 1

""""""""""""""""""""""""""""""""""""""""
" neosnippet
""""""""""""""""""""""""""""""""""""""""
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = $XDG_DATA_HOME . '/nvim/plugged/neosnippet-snippets/neosnippets'
