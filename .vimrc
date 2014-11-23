language messages en
" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'Logcat-syntax-highlighter'
Plugin 'tomasr/molokai'
Plugin 'wavded/vim-stylus'
Plugin 'AndrewRadev/vim-eco'
Plugin 'kchmck/vim-coffee-script'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
" Plugins Ende
call vundle#end()
filetype plugin indent on
" Vundle Ende

" Konfiguration
let mapleader=","
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
set autoindent
set smartindent
set cindent
set clipboard+=unnamed
au BufNewFile,BufRead *.md set filetype=markdown
" keymaps
imap <C-BS> <C-W>
imap <S-Tab> <Esc><<i
map <leader>n :NERDTreeToggle<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <leader>i gg=G''
" Spellchecker
setlocal spelllang=de_de
nnoremap <silent> <leader>s :set spell!<cr>
" No Beeping?
autocmd GUIEnter * set vb t_vb=
" Neocomplete
let g:neocomplcache_enable_at_startup = 1
