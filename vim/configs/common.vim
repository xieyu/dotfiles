" file
syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set autoread
set ffs=unix,dos,mac

set formatoptions+=m
set formatoptions+=B

" encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
set termencoding=utf-8


set nobackup
set noswapfile
set magic

set number
set nowrap

set showmatch
set foldenable

set nohlsearch
set incsearch

set title

set novisualbell
set noerrorbells

set mouse=a

" status bar
set ruler
set showmode
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2


hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set shiftround

set completeopt=longest,menu
set wildignore=*.o,*~,*.pyc,*.class

au InsertLeave * set nopaste

set autochdir
set autoread
set backspace=indent,eol,start

au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

"set clipboard=unnamed

autocmd BufNewFile,BufRead *.vue set ft=javascript syntax=html 
hi pythonSelf ctermfg=174 guifg=#6094DB cterm=bold gui=bold

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set autochdir