"            ---=== The Great VIM config ===---
"                    *** since 2014 ***
"
" --------------------- Vundle Plugins -------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
set synmaxcol=128
syntax sync minlines=256
set lazyredraw
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'git@github.com:jiangmiao/auto-pairs.git'
Plugin 'git@github.com:scrooloose/nerdcommenter.git'
Plugin 'git@github.com:tomtom/tlib_vim.git'
Plugin 'git@github.com:vim-airline/vim-airline.git'
Plugin 'git@github.com:jeetsukumaran/vim-buffergator.git'
Plugin 'git@github.com:garbas/vim-snipmate.git'
Plugin 'git@github.com:I159/vim-snippets.git'
Plugin 'git@github.com:michalbachowski/vim-wombat256mod.git'
Plugin 'git@github.com:MarcWeber/vim-addon-mw-utils.git'
Plugin 'git@github.com:tpope/vim-surround.git'
Plugin 'git@github.com:tpope/vim-eunuch.git'
Plugin 'git@github.com:airblade/vim-gitgutter.git'
Plugin 'git@github.com:scrooloose/nerdtree.git'
Plugin 'git@github.com:elzr/vim-json.git'
Plugin 'git@github.com:tarekbecker/vim-yaml-formatter.git'
Plugin 'git@github.com:mileszs/ack.vim'
Plugin 'git@github.com:mgedmin/coverage-highlight.vim.git'
Plugin 'git@github.com:majutsushi/tagbar.git'

" Python specific
Plugin 'git@github.com:davidhalter/jedi-vim.git'
Plugin 'git@github.com:jeetsukumaran/vim-indentwise.git'
Plugin 'git@github.com:w0rp/ale.git'
Plugin 'git@github.com:sheerun/vim-polyglot.git'

" Go specific
Plugin 'git@github.com:fatih/vim-go.git'

" JS specific
Plugin 'git@github.com:pangloss/vim-javascript.git'
Plugin 'git@github.com:ternjs/tern_for_vim.git'
Plugin 'git@github.com:prettier/vim-prettier.git'

call vundle#end()            " required

" ----------------------- settings -----------------------------

filetype plugin indent on " Use indentation scripts located in the indent folder
filetype plugin on " Enable plugin vim scripts located in ftplugin directory
syntax on " Syntax on... Any kind of
colorscheme wombat256mod " Color scheme wombat256

set nocompatible " Disable vi compatibility
set nu " Set line numbers
set backspace=2
set confirm " Confirm save on exit
set nowrap " lines will not wrap and only part of long lines will be displayed.
set spell " Spell check
hi clear SpellBad
hi SpellBad cterm=underline
set tabstop=4 " Short tabs
set shiftwidth=4 " 4 columns text is indented with the reindent operations (<< and >>) and automatic C-style indentation.
set expandtab
set list " Show trailing white spaces
set listchars=trail:.,tab:>- " Show tabs as >-
"set cursorline " Highlight currenr line
" Move backups and swaps to tmp
set backup
set swapfile
set dir=/tmp
set backupdir=/tmp
set directory=/tmp
set pastetoggle=<f5> " Toggle paste mode
set foldmethod=manual
set foldlevel=10 " Keep folds opened
set scrolloff=50 " Keep cursor centered
let g:pymode_rope = 0 "Disable rope

let mapleader = "," " Set leader
let g:AutoPairsShortcutToggle = '<leader>pp' " Auto pairs toggle
" NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '\.egg-info[[dir]]', '__pycache__', 'build$', 'dist', 'vendor', '\.zip$']
" Format yaml lists with extra
let g:yaml_formatter_indent_collection=1
" ----------------------- mappings ------------------------------

" Normal mode
" Left
"nnoremap <C-h> <C-W><C-H>
"" Down
"nnoremap <C-j> <C-W><C-J>
"" Up
"nnoremap <C-k> <C-W><C-K>
"" Right
"nnoremap <C-l> <C-W><C-L>
" Save with ,w
noremap <leader>w :w<CR>
" Exit with ,q
noremap <leader>q :q<CR>
" Save and exit with ,x
noremap <leader>x :wq<CR>
" NERDTree toggle
noremap <leader>n :NERDTreeToggle<CR>
" Explore buffers
nnoremap <leader>v :BuffergatorToggle<CR>
" Line break
noremap <leader>lb i<CR><Esc>
" Remove trailing white spaces
noremap <leader>dt :%s/\s\+$//e<CR>
" Reset search highlighting
noremap <F4> :set hlsearch! hlsearch?<CR>
" Show mappings
nnoremap <leader>mp :map<CR>
" Show index
nnoremap <leader>hi :help index<CR>
" Remove brackets in pair
nnoremap <leader>bb %ma%x`ax
" Install plugins
nnoremap <leader>pl :PluginInstall<CR>
" Refresh file
nnoremap <leader>ed :edit<CR>
" Vortex mode of split jump
nnoremap <silent> <S-Right> <c-w>l
nnoremap <silent> <S-Left> <c-w>h
nnoremap <silent> ˆ <c-w>k
nnoremap <silent> ´ <c-w>j
nnoremap <leader>ss :!mks .vimsessions.vim<cr>
nnoremap <leader>ls :source .vimsessions.vim<cr>
nnoremap <leader>ac :Ack!<Space>
nnoremap <leader>hc :HighlightCoverage<CR>
nnoremap <F8> :TagbarToggle<CR>
" Insert mode no-arrows navigation
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-l> <Right>

" json autoformat
nnoremap <leader>jf :execute '%!python -m json.tool'<CR>
" yaml autoformat
nnoremap <leader>yf :YAMLFormat<CR>

" Move line down <A-m>
nnoremap µ :m .+1<CR>==
" Move line up: <A-d>
nnoremap ∂ :m .-2<CR>==
" Paste from + register with <A-v>
inoremap √ <c-r><c-o>+

" Remember last position of file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
