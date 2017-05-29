" ~/.config/nvim/init.vim

language en_US
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.dotfiles/nvim/bundle')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'yssl/QFEnter'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'dracula/vim'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'neomake/neomake'
Plug 'ngmy/vim-rubocop'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'flowtype/vim-flow'
Plug 'pangloss/vim-javascript'

Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }
Plug 'osyo-manga/vim-monster', { 'for': 'ruby' }

Plug 'ervandew/supertab'

call plug#end()


filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" color
syntax enable
set background=dark
colorscheme dracula
set t_Co=256

" Indent
set autoindent cindent expandtab
set softtabstop=2 shiftwidth=2
set list
autocmd Filetype python setlocal ts=4 sts=4 sw=4

" UI Config
set number relativenumber title ruler
set showcmd laststatus=2
set showmatch
set wildmenu

" Mapping
let mapleader=","
nnoremap <Leader>rc :rightbelow vnew $MYVIMRC<CR>
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR> " find current open file in NERDTree 
map <C-t> :FZF<CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Searching
set hlsearch incsearch
nnoremap <ESC> :noh<CR><ESC>

set autoread
set encoding=utf8

" NERDTree
autocmd FileType nerdtree setlocal nolist
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open a NERDTree automatically when vim starts up on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Airline
let g:airline#extensions#tabline#enabled =1 " turn on buffer list
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dracula'

" Vim-devicon
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Vim-nerdtree-syntax-highlight
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" NERDcomment
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Neomake
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_javascript_enabled_makers = ['eslint']

" flowtype
" Temporal disable
let g:flow#enable = 1
let g:javascript_plugin_flow = 1
let g:flow#omnifunc = 0
let g:flow#autoclose = 1

" Deoplete
let g:deoplete#enable_at_startup = 1

let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}

autocmd! BufWritePost * Neomake
" fugitive
autocmd QuickFixCmdPost *grep* cwindow
