let mapleader ="\\"

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

set number relativenumber
set nohlsearch
syntax on
set nocompatible

call plug#begin('~/.config/nvim/plugged')
Plug 'mcchrish/nnn.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'lervag/vimtex'
Plug 'AndrewRadev/id3.vim'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
call plug#end()

map <C-o> :NERDTreeToggle<CR>

filetype plugin indent on
vnoremap <silent><Leader>y "yy <Bar> :call system('xclip', @y)<CR>
set clipboard=unnamedplus
inoremap <leader><leader> <Esc>/<-.-><Enter>"_c5l
vnoremap <leader><leader> <Esc>/<-.-><Enter>"_c5l
map <leader><leader> <Esc>/<-.-><Enter>"_c5l

map <leader>nd :Goyo <CR>
map <leader>yd :Goyo! <CR>

map <leader>b :vsp<space>$BIB<CR>

let g:vimwiki_list = [{'path': '~/.wiki'}, {'path': '~/.wiki2'}]
