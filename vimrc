set nocompatible
set hidden
filetype off
syntax enable
set guifont=Monaco:h16
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set hlsearch
set mouse=a
set number
set title

" Mapping Leaders
let mapleader = ' '
map <Leader>vi :e ~/.vimrc<CR>
map <Leader>so :source ~/.vimrc<CR>
map <Leader>i mmgg=G'm
nnoremap <Leader>v :vs<CR>
nnoremap <Leader>h :sp<CR>
" Global copy paste
map <Leader>y "+y
map <Leader>p "+p

" Fix Backspace
set backspace=eol,start,indent

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Set ignore options
if exists("&wildignorecase")
   set wildignorecase
 endif


set wildmode=list:longest
set wildmenu
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*node_modules*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.cache
set wildignore+=*.png,*.jpg,*.gif

call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'tomtom/tlib_vim'
Plug 'sheerun/vim-polyglot'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/snipmate-snippets'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-sleuth'
Plug 'cakebaker/scss-syntax.vim'
Plug 'matze/vim-move'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise' " Adds end to things that need it...
Plug 'w0ng/vim-hybrid'
Plug 'lilydjwg/colorizer'
Plug 'benekastah/neomake'
Plug 'MarcWeber/vim-addon-mw-utils'


call plug#end()            " required
filetype plugin indent on    " required
let g:ctrlp_working_path_mode = 'r'
" Molokai + Color editor
set background=dark
colorscheme hybrid

" Map jj to escape key to avoid pressing ESC
imap jj <Esc>

" Fix Matching Parenths
hi MatchParen      ctermfg=033  ctermbg=234 cterm=bold

" Marks things passing 160 characters
" highlight ColorColumn ctermbg=magenta
" call matchadd('ColorColumn', '\%81v', 100)

" Set Cursor Line Number Colors
hi clear CursorLine
hi CursorLineNR ctermfg=026 cterm=bold
hi LineNr ctermbg=235
augroup CLSet
  autocmd! ColorScheme * hi clear CursorLine
  autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END
highlight LineNr ctermbg=black
set cursorline

" Required for airline to show up
set laststatus=2

" Set more natural splits
set splitright
set splitbelow

" Clear all trailling whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
autocmd! BufWritePost * Neomake
autocmd! BufRead * Neomake

" Set .es6 files to use javascript syntax
au BufNewFile,BufRead *.es6 set filetype=javascript

" Airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let NerdTreeRespectWildIgnore = 1

" Change Modifier for Moving items up and down
nnoremap <C-l> :bnext<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <C-h> :bprevious<CR>
nnoremap <C-n> :enew<CR>
nnoremap <C-x> :bp <BAR> bd #<CR>
nnoremap <C-p> :CtrlP<CR>
let g:move_key_modifier = 'C'
