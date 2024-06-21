" .vimrc

" Set encoding to UTF-8
set encoding=utf-8

" Enable line numbers
set number

" Enable syntax highlighting
syntax on

" Set color scheme
colorscheme desert

" Highlight the current line
set cursorline

" Set the default tab width and convert tabs to spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Enable auto-indentation
set autoindent
set smartindent

" Show matching parentheses
set showmatch

" Enable incremental search
set incsearch

" Ignore case when searching
set ignorecase
" Override ignore case if search pattern contains uppercase letters
set smartcase

" Enable command line completion
set wildmenu

" Enable mouse support
set mouse=a

" Set the clipboard to use the system clipboard
set clipboard=unnamedplus

" Set up backspace to behave more intuitively
set backspace=indent,eol,start

" Customize the status line
set statusline=%F%m%r%h%w\[FORMAT=%{&fileformat}\]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]

" Enable syntax highlighting for specific file types
au BufRead,BufNewFile *.py set filetype=python
au BufRead,BufNewFile *.js set filetype=javascript

" Set up a basic key mapping for saving and quitting
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Load plugins (assuming you're using a plugin manager like vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" NERDTree settings
map <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree | wincmd p

" FZF settings
nnoremap <leader>f :Files<CR>
