set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'jacob-ogre/vim-syncr'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'w0rp/ale'
Plugin 'jeetsukumaran/vim-indentwise'
Plugin 'machakann/vim-swap'
Plugin 'ludovicchabant/vim-gutentags'
set rtp+=/usr/local/opt/fzf
"set rtp+=/usr/local/bin/fzf
Plugin 'junegunn/fzf.vim'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
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
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set wildmode=longest,list,full
set wildmenu
map <F6> :!ruby %<CR>
"color
"olorscheme jellybeans
colorscheme solarized
"colorscheme monokai
"set t_Co=256
"set background=dark

"Line number relative except for current line
set relativenumber
set number

"searching
set incsearch
" highlight all matches
set hlsearch
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

"Set the vimsplit to open to the right and below
set splitbelow
set splitright

"Vim window movement
"c-h is left
"c-l is right
"c-u is up
"c-d is down
nnoremap <C-L> <C-W><C-L>
nnoremap <C-U> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-D> <C-W><C-J>
imap <silent> <C-L> <ESC><C-L>
imap <silent> <C-U> <ESC><C-U>
imap <silent> <C-H> <ESC><C-H>
imap <silent> <C-D> <ESC><C-D>

"Nerd tree
map <C-n> :NERDTreeToggle<CR>
"Open nerd tree by default
"autocmd vimenter * NERDTree
"autocmd vimenter * wincmd p

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

"Copy/paste with clipboard
set clipboard=unnamed

"vim syncr
"command to sync on write
autocmd BufWritePost * :Suplfil                     " automatic syncr upload on write`
"command to open up remote switcher
map <Leader>sw :!/Users/xdesai/src/trustedpath/serv_switch<cr>

"make backspace work 
set backspace=indent,eol,start
let g:ctrlp_working_path_mode = 'c'

"Ctags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
",b will show all tags in tagbar
nnoremap <silent> ,b :TagbarToggle<CR>
"auto open tagbar
"autocmd vimenter * TagbarToggle
"Search recursively up for tags file
set tags=tags;/

"make ctrl-p faster
let g:ctrlp_cmd = 'CtrlPMRU'
" Use the silver searcher to generate our file list, and pymatcher for search
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l -i --nocolor --nogroup --hidden
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore .DS_Store
        \ --ignore "*.min.js"
        \ --ignore "*.min.map"
        \ --ignore "**/*.pyc"
        \ -g ""'
    let g:ctrlp_use_caching = 0
endif
"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

"Fuzzy finder (fzf)
map <C-f> :Files<cr>
map <C-b> :Lines<cr>
map <C-w> :Windows<cr>
"preview for files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--preview', '~/.vim/bundle/fzf.vim/bin/preview.sh {}']}, <bang>0)

"preview for Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

"Autoclose you complete me preview window
let g:ycm_autoclose_preview_window_after_completion=1

"Set pylint as linter for python files
let g:ale_linters = {'python': ['flake8', 'pylint', 'mypy'], 'javascript': ['eslint']}
"Set key bindings to jump to next lint error
nmap <silent> <leader>aj :ALENext<cr>

"Stop Ag from opening all searches over my current buffer
ca Ag Ag!

" pretty print json. here's the command for reference
nnoremap <leader>ej :%!python -m json.tool<cr>

" Explode \n to actual newlines
nnoremap <leader>en :%s/\\n/\r/g<cr>

" Opposite shift j
nnoremap <leader>k :s/ /\r/g<cr>

" When using `dd` in the quickfix list, remove the item from the quickfix list.
function! RemoveQFItem()
  let curqfidx = line('.') - 1
  let qfall = getqflist()
  call remove(qfall, curqfidx)
  call setqflist(qfall, 'r')
  execute curqfidx + 1 . "cfirst"
  :copen
endfunction
:command! RemoveQFItem :call RemoveQFItem()
" Use map <buffer> to only map dd in the quickfix window. Requires +localmap
autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>

" Write file as sudo
" :w !sudo tee %

"Ultisnips
" Ultisnips needs python 3 and that's not my default :-(
"macro expansion `\e`
"let g:UltiSnipsExpandTrigger="<leader>e"
"directory of snips
"let g:UltiSnipsSnippetDirectories=["UltiSnips", "personalsnippets"]
"Stop scary tracebacks
"au! UltiSnips_AutoTrigger

" Insert pdb
nnoremap <leader>p Oimport pdb; pdb.set_trace()<esc>
nnoremap <leader>t Oimport pytest; pytest.set_trace()<esc>

" copy file path to clipboard
nmap <leader>fp :let @+ = expand("%")<cr>

" see in statusbar when gutentags is generating a tag file
set statusline+=%{gutentags#statusline()}

" Gutentags to ignore files I don't want it to have
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ 'build',
      \ 'dist',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ '.mypy_cache',
      \ '3env',
      \ 'venv',
      \ '.venv',
      \ '.env',
      \ 'env',
      \ ]
