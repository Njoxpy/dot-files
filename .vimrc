set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Git plugin
Plugin 'tpope/vim-fugitive'

" Syntax highlighting
Plugin 'sheerun/vim-polyglot'

" File explorer
Plugin 'preservim/nerdtree'

" Status line
Plugin 'vim-airline/vim-airline'

" Theme
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before this line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" Set encoding and file format
set encoding=utf-8
set fileformat=unix

" Enable syntax highlighting
syntax on

" Set line numbers
set number
set relativenumber

" Set tab settings
set tabstop=2
set shiftwidth=2
set expandtab

" Enable auto-indentation
set smartindent
set autoindent

" Set search settings
set ignorecase
set smartcase
set incsearch
set hlsearch

" Enable mouse support
set mouse=a

" Show current line in the status line
set cursorline

" Set background color
set background=dark

" Show matching brackets
set showmatch

" Enable line wrapping
set wrap

" Use system clipboard
set clipboard=unnamedplus

" Set up file type detection and indentation
filetype plugin indent on

" Set colors for different file types
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType css setlocal tabstop=2 shiftwidth=2 expandtab

" Key mappings
nnoremap <C-n> :NERDTreeToggle<CR> " Toggle NERDTree
nnoremap <C-p> :Files<CR>           " Fuzzy file finder
nnoremap <Leader>r :source %<CR>    " Reload current .vimrc file

" Additional settings for better experience
set wrapscan                  " Wrap search
set showcmd                   " Show command in bottom bar
set hidden                    " Allow switching buffers without saving

" Status line settings
let g:airline_theme='dark'
let g:airline_powerline_fonts=1

" Set colorscheme
colorscheme gruvbox
set termguicolors            " Enable 24-bit RGB colors
