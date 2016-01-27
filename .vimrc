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
map <Leader>vi :e ~/.vimrc<CR>
map <Leader>so :source ~/.vimrc<CR>
map <Leader>i mmgg=G'm

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

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Misc
Plugin 'sheerun/vim-polyglot'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'

" Multiple Word Selection using Ctrl+n
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-sleuth'
Plugin 'cakebaker/scss-syntax.vim'

" Moves lines up and down with cmd+j/k
Plugin 'matze/vim-move'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

Plugin 'tpope/vim-endwise' " Adds end to things that need it...

" Color Scheme
Plugin 'w0ng/vim-hybrid'
Plugin 'lilydjwg/colorizer'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Molokai + Color editor
set background=dark
colorscheme hybrid

" Map jj to escape key to avoid pressing ESC
:imap jj <Esc>

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

" Set .es6 files to use javascript syntax
au BufNewFile,BufRead *.es6 set filetype=javascript

" Airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Change Modifier for Moving items up and down
let g:move_key_modifier = 'C'
