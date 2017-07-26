" ~/.config/nvim/init.vim

language en_US
set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on



"
" Plugin
"
call plug#begin('~/.dotfiles/nvim/bundle')

Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'yssl/QFEnter'

" airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" theme
Plug 'dracula/vim'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" linter
Plug 'w0rp/ale'

Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'

" auto-complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'mhartington/nvim-typescript'

" syntax-highlight
Plug 'leafgarland/typescript-vim'

Plug 'ervandew/supertab'

call plug#end()



"
" UI Config
"
set number relativenumber title ruler
set showcmd laststatus=2
set showmatch
set wildmenu

" More natural split opening
set splitbelow
set splitright

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



"
" Mapping
"
let mapleader=","
nnoremap <Leader>rc :rightbelow vnew $MYVIMRC<CR>
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR> " find current open file in NERDTree
map <C-w> :FZF<CR>

" Avoid ESC
:imap jk <Esc>

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

" Disable arrow keys
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
let g:airline#extensions#ale#enabled = 1
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


" Ale
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_open_list = 1


" Deoplete
let g:deoplete#enable_at_startup = 1


" fugitive
autocmd QuickFixCmdPost *grep* cwindow
