" ==============================================================================
" --- VUNDLE SETUP ---
" ==============================================================================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" --- Core ---
Plugin 'tpope/vim-fugitive'
Plugin 'sheerun/vim-polyglot'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" --- Fuzzy Finding ---
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" --- UI / Themes ---
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'                " 🔥 the chosen one
Plugin 'sainnhe/gruvbox-material'       " even better gruvbox
Plugin 'sainnhe/sonokai'                " keep as fallback
Plugin 'catppuccin/vim'                 " super pretty alternative
Plugin 'ryanoasis/vim-devicons'
Plugin 'Yggdroot/indentLine'
Plugin 'mhinz/vim-startify'
Plugin 'ap/vim-css-color'
Plugin 'machakann/vim-highlightedyank'   " flash highlight what you yank
Plugin 'RRethy/vim-illuminate'           " highlight other uses of word under cursor
Plugin 'luochen1990/rainbow'             " rainbow brackets

" --- LSP / Intellisense ---
Plugin 'neoclide/coc.nvim'

" --- Git ---
Plugin 'airblade/vim-gitgutter'

" --- Productivity ---
Plugin 'voldikss/vim-floaterm'
Plugin 'psliwka/vim-smoothie'
Plugin 'wakatime/vim-wakatime'

" --- Navigation / Editing ---
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()
filetype plugin indent on

" ==============================================================================
" --- GENERAL ---
" ==============================================================================
set encoding=utf-8
set fileformat=unix
set hidden
set mouse=a
set clipboard=unnamedplus
set updatetime=100
set noswapfile
set nobackup
set undofile
set undodir=~/.vim/undodir
set splitbelow splitright
set scrolloff=10
set sidescrolloff=8
set lazyredraw                " smoother performance
set ttyfast

if !has('nvim')
  set ttymouse=sgr
endif

" ==============================================================================
" --- UI ---
" ==============================================================================
syntax on
set termguicolors
set background=dark
set number
set relativenumber
set cursorline
set showmatch
set showcmd
set signcolumn=yes
set wrap
set linebreak                 " wrap at word boundaries, not mid-word
set colorcolumn=100
set fillchars=vert:┃,fold:·,eob:\      " cleaner split separator, hide ~ at EOF
set list
set listchars=tab:→\ ,trail:·,nbsp:␣,extends:»,precedes:«

" ==============================================================================
" --- THEME (Gruvbox Material — the sexy one) ---
" ==============================================================================
let g:gruvbox_material_background = 'hard'           " 'soft' | 'medium' | 'hard'
let g:gruvbox_material_foreground = 'material'       " 'material' | 'mix' | 'original'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_diagnostic_text_highlight = 1
let g:gruvbox_material_diagnostic_line_highlight = 1
let g:gruvbox_material_current_word = 'bold'
let g:gruvbox_material_transparent_background = 1    " 🔥 full transparency

colorscheme gruvbox-material

" Extra transparency polish (in case terminal doesn't honor it)
hi Normal guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi VertSplit guibg=NONE ctermbg=NONE guifg=#3a3735
hi StatusLine guibg=NONE
hi StatusLineNC guibg=NONE
hi CursorLineNr guifg=#fabd2f gui=bold

" ==============================================================================
" --- INDENTATION ---
" ==============================================================================
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

autocmd FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType rust setlocal tabstop=4 shiftwidth=4 expandtab

" ==============================================================================
" --- SEARCH ---
" ==============================================================================
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan

" ==============================================================================
" --- KEY MAPPINGS ---
" ==============================================================================
let mapleader = " "

" File explorer
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>e :NERDTreeFind<CR>

" Fuzzy finding
nnoremap <C-p> :Files<CR>
nnoremap <C-r> :History<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Rg<CR>
nnoremap <Leader>h :History<CR>

" Search / saves
nnoremap <Leader><Space> :nohlsearch<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>r :source $MYVIMRC<CR>

" Git
nnoremap <Leader>g :Git<CR>
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gd :Gdiffsplit<CR>
nnoremap <Leader>gb :Git blame<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Leader>x :bdelete<CR>

" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Keep selection when indenting
vnoremap < <gv
vnoremap > >gv

" Center on jump
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Floating terminal
nnoremap <silent> <C-`> :FloatermToggle<CR>
tnoremap <silent> <C-`> <C-\><C-n>:FloatermToggle<CR>

" ==============================================================================
" --- COC ---
" ==============================================================================
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> <Leader>d <Plug>(coc-diagnostic-next)
nmap <silent> <Leader>D <Plug>(coc-diagnostic-prev)
nmap <Leader>rn <Plug>(coc-rename)
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" ==============================================================================
" --- INDENTLINE ---
" ==============================================================================
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#3a3735'
let g:indentLine_color_term = 239
let g:indentLine_fileTypeExclude = ['startify', 'nerdtree', 'help', 'markdown']
let g:indentLine_bufTypeExclude = ['help', 'terminal']
let g:indentLine_showFirstIndentLevel = 1

" ==============================================================================
" --- RAINBOW BRACKETS ---
" ==============================================================================
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['#fabd2f', '#fb4934', '#b8bb26', '#83a598', '#d3869b', '#8ec07c'],
\   'ctermfgs': ['yellow', 'red', 'green', 'blue', 'magenta', 'cyan'],
\}

" ==============================================================================
" --- HIGHLIGHTED YANK ---
" ==============================================================================
let g:highlightedyank_highlight_duration = 300
highlight HighlightedyankRegion guibg=#fabd2f guifg=#282828

" ==============================================================================
" --- ILLUMINATE (highlight matching word under cursor) ---
" ==============================================================================
let g:Illuminate_delay = 200
hi link illuminatedWord Visual

" ==============================================================================
" --- FZF CONFIGURATION ---
" ==============================================================================
" Floating window centered on screen
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8, 'border': 'rounded' } }

" Preview window with syntax highlighting
let g:fzf_preview_window = ['right:50%:wrap', 'ctrl-/']

" Use ripgrep for Rg command with better defaults
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview(),
  \   <bang>0)

" Files with preview
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Match fzf colors to gruvbox
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Comment'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \ }

" Ignore node_modules and other junk in Files command
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!node_modules/*" --glob "!.git/*" --glob "!dist/*" --glob "!build/*"'

" ==============================================================================
" --- AIRLINE ---
" ==============================================================================
let g:airline_theme = 'gruvbox_material'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1

" Custom separators (smoother powerline)
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Pretty mode labels
let g:airline_mode_map = {
    \ 'n'  : '●  NORMAL',
    \ 'i'  : '✎  INSERT',
    \ 'v'  : '◆  VISUAL',
    \ 'V'  : '◆  V-LINE',
    \ 'c'  : '⚙  COMMAND',
    \ 'R'  : '⟲  REPLACE',
    \ 't'  : '▶  TERMINAL',
    \ }

" ==============================================================================
" --- GITGUTTER ---
" ==============================================================================
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed = '▁'
let g:gitgutter_sign_modified_removed = '▎'
let g:gitgutter_preview_win_floating = 1
highlight GitGutterAdd    guifg=#b8bb26 guibg=NONE
highlight GitGutterChange guifg=#fabd2f guibg=NONE
highlight GitGutterDelete guifg=#fb4934 guibg=NONE

" ==============================================================================
" --- COC DIAGNOSTIC SIGNS ---
" ==============================================================================
highlight CocErrorSign guifg=#fb4934 guibg=NONE
highlight CocWarningSign guifg=#fabd2f guibg=NONE
highlight CocInfoSign guifg=#83a598 guibg=NONE
highlight CocHintSign guifg=#b8bb26 guibg=NONE

if exists('*sign_define')
  call sign_define('CocError',   {'text': '✘', 'texthl': 'CocErrorSign'})
  call sign_define('CocWarning', {'text': '▲', 'texthl': 'CocWarningSign'})
  call sign_define('CocInfo',    {'text': 'ℹ', 'texthl': 'CocInfoSign'})
  call sign_define('CocHint',    {'text': '›', 'texthl': 'CocHintSign'})
endif

" ==============================================================================
" --- NERDTREE ---
" ==============================================================================
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = ['\.git$', 'node_modules$', '\.DS_Store$']
let NERDTreeStatusline = ''
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  : '●',
    \ 'Staged'    : '✚',
    \ 'Untracked' : '✭',
    \ 'Renamed'   : '➜',
    \ 'Unmerged'  : '═',
    \ 'Deleted'   : '✖',
    \ 'Dirty'     : '✗',
    \ 'Clean'     : '✔',
    \ 'Unknown'   : '?'
    \ }

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ==============================================================================
" --- STARTIFY ---
" ==============================================================================
let g:startify_padding_left = 5
let g:startify_custom_header = [
      \ '',
      \ '   ███╗   ██╗     ██╗ ██████╗ ██╗  ██╗██████╗ ██╗   ██╗',
      \ '   ████╗  ██║     ██║██╔═══██╗╚██╗██╔╝██╔══██╗╚██╗ ██╔╝',
      \ '   ██╔██╗ ██║     ██║██║   ██║ ╚███╔╝ ██████╔╝ ╚████╔╝ ',
      \ '   ██║╚██╗██║██   ██║██║   ██║ ██╔██╗ ██╔═══╝   ╚██╔╝  ',
      \ '   ██║ ╚████║╚█████╔╝╚██████╔╝██╔╝ ██╗██║        ██║   ',
      \ '   ╚═╝  ╚═══╝ ╚════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝        ╚═╝   ',
      \ '',
      \ '              » built different, ship different «',
      \ '',
      \ ]

let g:startify_custom_footer = [
      \ '',
      \ '   ─────────────────────────────────────────',
      \ '   Dar es Salaam → Everywhere',
      \ '',
      \ ]

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Recent Files'] },
      \ { 'type': 'dir',       'header': ['   Recent in '. getcwd()] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:startify_bookmarks = [
      \ { 'v': '~/.vimrc' },
      \ { 'z': '~/.zshrc' },
      \ ]

let g:startify_enable_special = 0
let g:startify_change_to_dir = 1
let g:startify_fortune_use_unicode = 1