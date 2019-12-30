" be iMproved, required
set nocompatible              
set backspace=indent,eol,start

" required
filetype off                  

" hide buffers rather than close them if unsaved changes persist on buffer switch
set hidden

" enable language-specific syntax highlighting
syntax enable

" set color theme
colo elflord

" show line numbers
set number

" set tabs to have 4 spaces
set tabstop=4
set softtabstop=4

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" search as characters are entered
set incsearch

" highlight matches
set hlsearch

" leader is comma
let mapleader=","

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" enable folding
set foldenable

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" tabs turn into spaces
set expandtab

" indent when moving to the next line
set autoindent
set pastetoggle=<leader>p

" bind jj to Esc only in insert mode
inoremap jj <Esc>
