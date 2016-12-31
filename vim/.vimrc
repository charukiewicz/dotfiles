set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline'
Plugin 'unblevable/quick-scope'
Plugin 'kien/ctrlp.vim'
Plugin 'adoy/vim-php-refactoring-toolbox'
Plugin 'godlygeek/tabular'
Plugin 'wikitopian/hardmode'
Plugin 'Valloric/YouCompleteMe'
Plugin 'lambdatoast/elm.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""
"highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

" airline config
let g:airline_powerline_fonts = 0
"if empty($SSH_CLIENT)
"    let g:airline_powerline_fonts = 1
"endif
set laststatus=2

" enable language-specific syntax highlighting
syntax enable

" enable 256 colors
set t_Co=256

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

" turn on NERDTree with C-n
map <C-n> :NERDTreeToggle<CR>

" open NERDTree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers=['php','phpcs','phpmd']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_haskell_checkers = ['hlint']
" let b:syntastic_skip_checks = 0

map <silent> <Leader>e :Errors<CR>
map <Leader>w :SyntasticToggleMode<CR>

" Insert into your .vimrc after quick-scope is loaded.
" Obviously depends on <https://github.com/unblevable/quick-scope> being installed.

" enable quick_scope conditionally
let g:qs_enable = 0
let g:qs_enable_char_list = [ 'f', 'F', 't', 'T' ]

function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw!
        let needs_disabling = 1
    endif
    let letter = nr2char(getchar())
    if needs_disabling
        QuickScopeToggle
    endif
    return a:movement . letter
endfunction

" quick_scope maps, operator-pending mode included (can do 'df' with hint)
for i in g:qs_enable_char_list
    execute 'noremap <expr> <silent>' . i . " Quick_scope_selective('". i . "')"
endfor

" Toggle hard mode
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" Turn on hard mode by default
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

map <leader><leader> :Shell ./build<CR><CR>

map <leader>d :bd<CR>
