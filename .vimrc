" --- Vundle Setup (Required) ---
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" --- Essential Plugins ---
Plugin 'tpope/vim-fugitive'          " Git integration
Plugin 'sheerun/vim-polyglot'        " Extensive syntax highlighting
Plugin 'preservim/nerdtree'          " File explorer

" --- VS Code Aesthetics & Functionality ---
" 1. Fuzzy File Finder (Crucial VS Code Feature)
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'

" 2. Status Line
Plugin 'vim-airline/vim-airline'

" 3. Theme
Plugin 'morhetz/gruvbox'

" 4. Icons (Requires Nerd Font)
Plugin 'ryanoasis/vim-devicons'

" 5. VS Code-like Popups/IntelliSense (LSP Core)
Plugin 'neoclide/coc.nvim'

" 6. WakaTime
Plugin 'wakatime/vim-wakatime'

" 7. Visual Indentation Guides (Fixed Plugin)
Plugin 'preservim/vim-indent-guides' 

" --- Vundle End ---
call vundle#end()
filetype plugin indent on

" --- General Settings ---
set encoding=utf-8
set fileformat=unix
set termguicolors             " Enable 24-bit RGB colors (essential for themes like gruvbox)
colorscheme gruvbox
set background=dark

" --- UI Enhancements (Visual Clarity) ---
syntax on
set number
set relativenumber            " Show relative line numbers (VS Code-like quick jump)
set cursorline                " Highlight the current line
set showmatch                 " Highlight matching brackets
set showcmd                   " Show command in bottom bar
set hidden                    " Allow switching buffers without saving (VS Code behavior)
set wrap                      " Enable line wrapping
set wrapscan                  " Wrap search
set clipboard=unnamedplus     " Use system clipboard
set ttymouse=sgr              " Enable scroll wheel in splits

" --- Indentation & Tabs ---
set tabstop=2
set shiftwidth=2
set expandtab                 " Use spaces instead of tabs
set smartindent
set autoindent

" File type-specific settings 
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType css setlocal tabstop=2 shiftwidth=2 expandtab

" --- Search Settings ---
set ignorecase
set smartcase
set incsearch
set hlsearch

" --- Mouse Support ---
set mouse=a

" --- Key Mappings (VS Code feel) ---
" --- Key Mappings (VS Code feel) ---
" Toggle NERDTree (File explorer)
nnoremap <C-n> :NERDTreeToggle<CR>

" Fuzzy File Finder (VS Code's Ctrl+P/Cmd+P experience)
nnoremap <C-p> :Files<CR>

" Fuzzy Text/Buffer Finder (VS Code's Ctrl+T/Cmd+T)
nnoremap <Leader>b :Buffers<CR>

" Reload current .vimrc file
nnoremap <Leader>r :source $MYVIMRC<CR>

" Fugitive Git Status (VS Code's Source Control) <-- ADD THESE TWO LINES
nnoremap <Leader>g :Git<CR>
nnoremap <Leader>gs :Git<CR>

" Toggle NERDTree (File explorer)
nnoremap <C-n> :NERDTreeToggle<CR>

" Fuzzy File Finder (VS Code's Ctrl+P/Cmd+P experience)
nnoremap <C-p> :Files<CR>

" Fuzzy Text/Buffer Finder
nnoremap <Leader>b :Buffers<CR>

" Smart Tab/Split Navigation (VS Code Window Switching)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" --- CoC (IntelliSense) Mappings ---
" Use <tab> for completion and snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction

" Use C-c to force close CoC windows
inoremap <C-c> <Esc>

" GoTo definitions (VS Code's F12)
nmap <silent> gd <Plug>(coc-definition)
" Show diagnostics (errors, warnings)
nmap <silent> <leader>d <Plug>(coc-diagnostic-next)

" --- Airline Status Line Settings ---
let g:airline_theme='gruvbox' 
let g:airline_powerline_fonts=1

" ==============================================================================
" --- NEW ENHANCEMENTS START HERE ---
" ==============================================================================

" --- 1. Visual Indentation Guides Configuration (vim-indent-guides) ---
" Enable the guides upon Vim startup
let g:indent_guides_enable_on_vim_startup = 1
" Set the character for the guide (subtle dotted line)
let g:indent_guides_guide_char = '┊' 
" Guide width (1 makes it thin and clean)
let g:indent_guides_guide_size = 1
" Use different colors for alternating indent levels (Optional: makes it look clean)
let g:indent_guides_auto_colors = 1 


" --- 2. CoC Visual Diagnostics (Error/Warning Icons in Sign Column) ---
" This uses Nerd Font icons for clear error feedback, like VS Code.
" Note: This must be defined AFTER 'colorscheme gruvbox'

" Define colors for diagnostic signs (using Gruvbox palette)
autocmd ColorScheme * highlight CocErrorSign guifg=#fb4934 guibg=none
autocmd ColorScheme * highlight CocWarningSign guifg=#fabd2f guibg=none
autocmd ColorScheme * highlight CocInfoSign guifg=#83a598 guibg=none
autocmd ColorScheme * highlight CocHintSign guifg=#b8bb26 guibg=none

" Define the Nerd Font symbols for each diagnostic type
if exists('*sign_define')
    "  (Exclamation Triangle),  (Warning Sign),  (Info Circle), 💡 (Lightbulb)
    call sign_define('CocError', {'text': '', 'texthl': 'CocErrorSign'})
    call sign_define('CocWarning', {'text': '', 'texthl': 'CocWarningSign'})
    call sign_define('CocInfo', {'text': '', 'texthl': 'CocInfoSign'})
    call sign_define('CocHint', {'text': '💡', 'texthl': 'CocHintSign'})
endif