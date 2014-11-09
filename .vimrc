language messages en
" vundle
filetype off
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin()
" Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'wavded/vim-stylus'
Plugin 'AndrewRadev/vim-eco'
Plugin 'kchmck/vim-coffee-script'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplcache.vim'
"plugins end
call vundle#end()
filetype plugin indent on
"vundle ende

"config
set hidden
set encoding=utf-8
let g:airline_powerline_fonts = 1
set laststatus=2
set directory=.,$TEMP
set nocompatible
set number
set hlsearch
set incsearch
set ignorecase
set smartcase
colorscheme molokai
set nowrap
syntax enable
set showcmd
set tabstop=4 shiftwidth=4
set expandtab
set backspace=indent,eol,start
set guifont=Sauce\ Code\ Powerline:h10:cANSI
set go-=m
set go-=T
set go-=r
set go-=L
set go-=e
map <C-n> :NERDTreeToggle<CR>
let mapleader=","
nmap <silent> <leader>ev :e $MYVIMRC<CR>
set autoindent
set smartindent
set cindent
set autochdir
set clipboard+=unnamed
au BufNewFile,BufRead *.md set filetype=markdown
imap <C-BS> <C-W>
"spell
setlocal spell spelllang=de_de
set spell
