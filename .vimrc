"	          ██
"	         ░░
"	 ██    ██ ██ ██████████  ██████  █████
"	░██   ░██░██░░██░░██░░██░░██░░█ ██░░░██
"	░░██ ░██ ░██ ░██ ░██ ░██ ░██ ░ ░██  ░░
"	 ░░████  ░██ ░██ ░██ ░██ ░██   ░██   ██
"	  ░░██   ░██ ███ ░██ ░██░███   ░░█████
"	   ░░    ░░ ░░░  ░░  ░░ ░░░     ░░░░░

" ==============================
"	Init
" ==============================
"
set nocompatible
set noshowmode
set encoding=utf-8
set fileencoding=utf-8

filetype on
filetype plugin on
filetype plugin indent on
" set window title = filename
set title

" ==============================
" Plugins
" ==============================
"

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'rking/ag.vim'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-vinegar'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()


" ==============================
"	Interface Settings
" ==============================
"
set number " Display line numbers on the left
set colorcolumn=81,121 " Set a column at 81 chars wide
set encoding=utf-8
set guifont=Inconsolata\ for\ Powerline
let g:syntastic_always_populate_loc_list = 1
set confirm " confim instead of error when leaving unsaved file
set mouse=a " Enable use of the mouse for all modes
let g:startify_custom_header = map(split(system('fortune -as | cowsay -f small'), '\n'), '"   ". v:val') + ['','']
let g:startify_change_to_vcs_root = 1
let g:ctrlp_reuse_window  = 'startify'
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

" ==============================
"	Color Scheme
" ==============================
"
syntax enable
set background=dark
colorscheme solarized
syntax on " Enable syntax highlighting
let g:solarized_termcolors=256
let macvim_skip_colorscheme=1
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" ==============================
"	Search
" ==============================
"
set hlsearch " highlight all results of a search
set incsearch " highlight first result of search whilst typing
set ignorecase " Use case insensitive search
set smartcase  "except when using capital letters
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
