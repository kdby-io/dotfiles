language en_US
set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


"
" Plugin
"
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.local/share/nvim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'itchyny/lightline.vim'

" nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" theme
Plug 'arcticicestudio/nord-vim'

" git
Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-fugitive'

" linter
Plug 'w0rp/ale'

Plug 'jiangmiao/auto-pairs'
" Plug 'scrooloose/nerdcommenter'
" Plug 'terryma/vim-multiple-cursors'

" auto-complete
" Plug 'valloric/youcompleteme'
Plug 'ervandew/supertab'

" syntax-highlight
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'


call plug#end()



"
" UI Config
"
set number title ruler
set showcmd laststatus=2
set showmatch
set wildmenu

" More natural split opening
set splitbelow
set splitright

" color
syntax enable
set background=dark
colorscheme nord
set t_Co=256


" Indent
set autoindent cindent expandtab
set softtabstop=2 shiftwidth=2
set nolist
autocmd Filetype python setlocal ts=4 sts=4 sw=4

highlight Comment cterm=italic


"
" Mapping
"
let mapleader=","
nnoremap <Leader>rc :rightbelow vnew $MYVIMRC<CR>
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR> " find current open file in NERDTree
map <C-t> :FZF<CR>

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
nnoremap <silent><leader>/ :noh<CR><ESC>

set autoread
set encoding=utf8


" NERDTree
autocmd FileType nerdtree setlocal nolist
let NERDTreeShowHidden=1
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open a NERDTree automatically when vim starts up on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"lightline
let g:lightline = { 'colorscheme': 'nord' }

" Vim-devicon
" let g:webdevicons_enable = 1
" let g:webdevicons_enable_nerdtree = 1
" let g:webdevicons_enable_airline_tabline = 1
" let g:webdevicons_enable_airline_statusline = 1
" let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0


" Vim-nerdtree-syntax-highlight
" let g:NERDTreeDisableExactMatchHighlight = 1
" let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxEnabledExtensions = [
  \ 'json',
  \ 'md',
  \ 'js', 'jsx',
  \ 'ts', 'tsx'
  \ ]

" NERDcomment
" Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1


" Ale
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_open_list = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
