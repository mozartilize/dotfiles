call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --go-completer --ts-completer' }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'joshdick/onedark.vim'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set bg=dark
set clipboard=unnamedplus
set number
set relativenumber
set cursorline
set updatetime=300
set signcolumn=yes
set autoindent
set smartindent

" Search as you type, highlight results
set incsearch
set showmatch
set hlsearch

set scrolloff=3
set sidescroll=3

set mouse=a
filetype plugin on
filetype plugin indent on
syntax on
set t_Co=256
colorscheme onedark
let g:onedark_termcolors=256

let g:loaded_python_provider = 0 " disable python2
let g:loaded_python3_provider = 0 " disable python3
" let g:python3_host_prog = '/usr/bin/python3'

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'

let g:fzf_preview_window = 'right:60%'

nnoremap <C-p> :<C-u>FZF<CR>
inoremap <C-c> <ESC>
" nnoremap <C-]> :YcmCompleter GoToDefinition<CR>
imap <C-k> <esc>O
imap <C-j> <esc>o
nnoremap Q <Nop>
map <C-\> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

set wildignore+=*/node_modules/*     " MacOSX/Linux
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'vue': ['prettier', 'eslint'],
\   'python': ['black', 'isort'],
\}
let g:ale_linters = {
\   'python': ['flake8'],
\}
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

set lazyredraw
set hidden

" Preferences for various file formats
autocmd FileType c setlocal noet ts=8 sw=8 tw=80
autocmd FileType h setlocal noet ts=8 sw=8 tw=80
autocmd FileType cpp setlocal noet ts=8 sw=8 tw=80
autocmd FileType s setlocal noet ts=8 sw=8
autocmd FileType go setlocal noet ts=4 sw=4
autocmd FileType hy setlocal filetype=lisp
autocmd FileType sh setlocal noet ts=4 sw=4
autocmd BufRead,BufNewFile *.js setlocal et ts=2 sw=2
autocmd FileType html setlocal et ts=2 sw=2
autocmd FileType htmldjango setlocal et ts=2 sw=2
autocmd FileType ruby setlocal et ts=2 sw=2
autocmd FileType scss setlocal et ts=2 sw=2
autocmd FileType yaml setlocal et ts=2 sw=2
autocmd FileType markdown setlocal tw=80 et ts=2 sw=2
autocmd FileType text setlocal tw=80
autocmd FileType meson setlocal noet ts=2 sw=2
autocmd FileType bzl setlocal et ts=2 sw=2
autocmd FileType typescript setlocal et ts=2 sw=2
autocmd FileType vue setlocal et ts=2 sw=2
autocmd FileType javascript setlocal et ts=2 sw=2
autocmd FileType python setlocal et ts=4 sw=4
autocmd BufNewFile,BufRead *.ms set syntax=python ts=4 sw=4 noet
autocmd FileType tex hi Error ctermbg=NONE
autocmd FileType mail setlocal noautoindent
augroup filetypedetect
  autocmd BufRead,BufNewFile *mutt-*              setfiletype mail
augroup filetypedetect
  autocmd BufRead,BufNewFile *qutebrowser-editor-* set ts=4 sw=4 et
autocmd BufNewFile,BufRead * if expand('%:t') == 'APKBUILD' | set ft=sh | endif
autocmd BufNewFile,BufRead * if expand('%:t') == 'PKGBUILD' | set ft=sh | endif
