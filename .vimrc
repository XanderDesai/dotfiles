
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree.git'
"Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdcommenter.git'
"Plugin 'Chiel92/vim-autoformat'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


syntax on
imap kj <ESC>
"set wildmenu
"set wildmode=list:longest,full
set tabstop=4
set shiftwidth=4
set softtabstop=4
set wildmode=longest,list,full
set wildmenu
set number
map <F6> :!ruby %<CR>
"color
"olorscheme jellybeans
"colorscheme solarized
"set t_Co=256
"set background=dark

"searching
set incsearch
"This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>

"show file name of file i'm working on
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

"stop obnoxious auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Mouse support
set mouse=a
"Vim tabbing
nnoremap	  ,t	:tabnew 
nmap <silent> <C-k> :tabnext<CR>
nmap <silent> <C-j> :tabprev<CR>
imap <silent> <C-k> <ESC><C-k>
imap <silent> <C-j> <ESC><C-j>

"Nerd tree
map <C-n> :NERDTreeToggle<CR>

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv
