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

" show the matching part of the pair for [] {} and ()
" set showmatch

" search as characters are entered
set incsearch

" highlight matches
set hlsearch

" leader is comma
let mapleader=","

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"enable folding
set foldenable

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" tabs turn into spaces
set expandtab

" indent when moving to the next line
set autoindent
set pastetoggle=<leader>p

" highlight the line that the cursor/column is on
hi CursorLine   cterm=NONE ctermbg=DarkMagenta guibg=red guifg=white
hi CursorColumn cterm=NONE ctermbg=DarkMagenta guibg=red guifg=white
nnoremap <Leader>c :set cursorline!<CR>

" toggle spellcheck
:map <Leader>s :setlocal spell! spelllang=en_us<CR>

" turn on autocomplete (use with C-n or C-p in insert mode)
set complete+=kspell
