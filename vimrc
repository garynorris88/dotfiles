set nocompatible
set hidden
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
nnoremap <Leader>= mpHmhgg=G'hzt'p
nnoremap <Leader>v :vs<CR>
nnoremap <Leader>h :sp<CR>
" Global copy paste
map <Leader>y "+y
map <Leader>p "+p
nnoremap <Leader>-  vi{:'<,'>sort<CR>

" Fix Backspace
set backspace=eol,start,indent

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

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'benekastah/neomake'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'bling/vim-airline'
Plug 'cakebaker/scss-syntax.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'garbas/vim-snipmate'
Plug 'gmarik/Vundle.vim'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'lilydjwg/colorizer'
Plug 'matze/vim-move'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/yajs.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/snipmate-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-endwise' " Adds end to things that need it...
Plug 'tpope/vim-fugitive' " Adds end to things that need it...
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'w0ng/vim-hybrid'


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
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_js_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['rubocop']

" Change Modifier for Moving items up and down
nnoremap <C-l> :bnext<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <C-h> :bprevious<CR>
nnoremap <C-n> :enew<CR>
nnoremap <C-x> :bp <BAR> bd #<CR>
nnoremap <C-p> :CtrlP<CR>
let g:move_key_modifier = 'C'
let g:jsx_ext_required = 0
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
