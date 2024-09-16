"call and let needed functions (plugins, etc)
filetype plugin indent on
set nocompatible
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'sheerun/vim-polyglot'
Plugin 'lambdalisue/suda.vim'
Plugin 'yggdroot/indentline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'raimondi/delimitmate'
"
Plugin 'ervandew/supertab'
Plugin 'mbbill/undotree'
Plugin 'junegunn/gv.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
call vundle#end()
filetype plugin indent on
set clipboard=unnamed
let g:clipboard = {
    \   'copy': {
    \       '+': ['wl-copy', '--trim-newline'],
    \       '*': ['wl-copy', '--trim-newline'],
    \   },
    \   'paste': {
    \       '+': ['wl-paste', '--no-newline'],
    \       '*': ['wl-paste', '--no-newline'],
    \   },
    \ }
let NERDTreeShowHidden=1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"set colorscheme
colorscheme luna

" set font & text size
set guifont=Source\ Code\ Pro:h11

" add numbered lines
set nu

" turn on basic colored syntax
syntax on

" autorun on startup
autocmd VimEnter * AirlineTheme minimalist
autocmd FileType apache setlocal commentstring=#\ %s

"binds
nnoremap <C-s> :SudaWrite<CR>
nnoremap <C-c> :q!<CR>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
nnoremap <silent> <leader>c} V}:call NERDComment('x', 'toggle')<CR>
nnoremap <silent> <leader>c{ V{:call NERDComment('x', 'toggle')<CR>
nnoremap <silent> <c-t> :
