language messages en
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
" pathogen starten?!
execute pathogen#infect()
call pathogen#incubate()
" cursor tasten deaktivieren
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
au BufWritePost .vimrc so ~/.vimrc
set go-=m
set go-=T
set go-=r
set go-=L
set go-=e
map <C-n> :NERDTreeToggle<CR>
let mapleader=","
nmap <silent> <leader>ev :e $MYVIMRC<CR>
set showmatch
