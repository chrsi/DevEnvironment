syntax enable
set encoding=utf-8
set fileencoding=utf-8

set guifont=DejaVu_Sans_Mono:h12

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required


" Theme
set background=dark
let g:solarized_termcolors=16
colorscheme solarized

" Leader
let mapleader=","

" Tabs
set tabstop=2
set softtabstop=2
set expandtab

" Coding
set number
set cursorline
filetype indent on  "load filetype-specific indent files
set showmatch

" Various
set showcmd	"show last command in bottom bar

" Key Mapping
:imap jj <Esc>

"" Remap redo to ALT+r because CTRL+r is a useful msft vs command.
nnoremap <A-u> <C-r>

" Searching
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>    " turn off search highlight

" Folding
set foldenable
set foldlevelstart=10
nnoremap <space> za
set foldmethod=indent

" Movement
" Ignores broken lines when moving over lines
nnoremap j gj
nnoremap k gk

nnoremap B ^
nnoremap E $

" Delete lines above/below current line with CTRL
nnoremap <silent><Alt-Shift-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><Alt-Shift-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>

" Insert lines above/below current line with ALT
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

if &diff
  "only vimdiff

  map ] ]c
  map [ [c
endif
