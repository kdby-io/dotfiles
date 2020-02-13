
"========================= General Config ==============================

set nocompatible              "disable compatible with old vi
set shell=/usr/local/bin/zsh
filetype plugin on            "load filetype plugin files
filetype indent on            "set different indent by filetype

let g:mapleader = ","         "set leader key to comma

set title                     "change terminal title

"============================ UI Config ================================

set ruler                     "show the ruler on the right bottom
set number                    "show line number
set showmatch                 "highlight matched bracket on cursor
set showcmd                   "show typing command on status line
set laststatus=2              "show status line always

set hlsearch                  "highlight searching keywords
"set incsearch                 "


"========================== Window & Pane ==============================

set splitbelow                "make a new window appear on the bottom
set splitright                "make a new window appear on the right


"=========================== Indentation ===============================

set autoindent                "indent new line by the previous line
set smartindent               "indent new line by syntax & style
set cindent                   "set indentation for C
set expandtab                 "use space instead of tab
set tabstop=4                 "set width of real tab
set softtabstop=2             "set width of expanded tab
set shiftwidth=2              "set width of indent shifting


"=========================== Key Mapping ===============================

"Disable arrow keys
noremap <Up> <NOP> 
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"cancel searching highlight by ESC
nnoremap <silent><leader>/ :noh<CR><ESC>

"open neovim setting
nnoremap <Leader>rc :rightbelow vnew $MYVIMRC<CR>

"toggle NERDTree
nnoremap <Leader>f :NERDTreeToggle<CR>

"navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>


"========================== Auto Commands ==============================

autocmd Filetype python setlocal sts=4 sw=4
autocmd Filetype js setlocal sts=2 sw=2
autocmd Filetype ts setlocal sts=2 sw=2


"============================= Plugins =================================

" Install vim-plug automatically
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.local/share/nvim/plugged')

"Plug 'christoomey/vim-tmux-navigator'
"Plug 'benmills/vimux'

"----- nerdtree -----
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

"----- auto completion -----
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-json', 'coc-prettier']

Plug 'airblade/vim-gitgutter'
Plug 'Shougo/denite.nvim'

"----- theme -----
Plug 'morhetz/gruvbox'

"----- typescript -----
Plug 'HerringtonDarkholme/yats.vim'   "syntax file

call plug#end()


set wildmenu
"syntax enable
"highlight Comment cterm=italic


"========================== Plugin Settings ============================


"============================== coc.nvim ===============================
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)


"============================== Theme ==================================

colorscheme gruvbox
set background=light
set termguicolors

