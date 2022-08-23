set nocompatible
call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/indentLine'

Plug 'ggandor/lightspeed.nvim', {'branch': 'main'}
Plug 'scrooloose/nerdtree'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"fuzzy jump and search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'sbdchd/neoformat'

Plug 'lfv89/vim-interestingwords'

"color theme
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'glepnir/zephyr-nvim'
Plug 'shaunsingh/nord.nvim'

Plug 'weirongxu/plantuml-previewer.vim'

"rust
Plug 'rust-lang/rust.vim'
"go
Plug 'fatih/vim-go'
Plug 'aklt/plantuml-syntax'
Plug 'uarun/vim-protobuf'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml',                 {'for': 'yaml'}
Plug 'andrewstuart/vim-kubernetes',      {'for': 'yaml'}
Plug 'ekalinin/Dockerfile.vim',          {'for': 'dockerfile'}
Plug 'elzr/vim-json',                    {'for': 'json'}
Plug 'ap/vim-css-color',                 {'for': 'css'}
Plug 'vim-scripts/awk.vim',              {'for': 'awk'}

Plug 'davidgranstrom/nvim-markdown-preview'

Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0


Plug 'prettier/vim-prettier', {'branch': 'main'}

" git
Plug 'mhinz/vim-signify' 
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

Plug 'xieyu/vim-cd'

Plug 'nvim-lua/plenary.nvim'


call plug#end()

"Plugin settings
let g:indentLine_setConceal = 0

augroup fmt
  autocmd!
  autocmd BufWritePre *  Neoformat
augroup END


syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set re=1
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
set signcolumn=auto
set conceallevel=2

set showmatch
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

" tab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set shiftround

set completeopt=longest,menu
set wildignore=*.o,*~,*.pyc,*.class,.git
set wildmode=longest,list,full
set path+=**

au InsertLeave * set nopaste
set autoread
set backspace=indent,eol,start

set scl=auto
set cursorline
set showmatch


"set clipboard=unnamed
set clipboard=unnamed
set clipboard+=unnamedplus


autocmd BufNewFile,BufRead *.vue set ft=javascript syntax=html 
autocmd BufWritePost *.puml silent :w !plantuml -tsvg -charset UTF-8 -p > %:r.svg
autocmd BufWritePost *.dot.py silent !python3 % |dot -T svg -o "%:r.svg"

autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

hi pythonSelf ctermfg=174 guifg=#6094DB cterm=bold gui=bold

"fzf settings
set rtp+=/usr/local/opt/fzf

set background=dark
set t_Co=256

hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange



let $FZF_DEFAULT_COMMAND='rg --files --hidden -g "!{.git/*}"'


colorscheme onedark


"open plug github repo in browser by press enter
function! s:go_github()
    let s:repo = matchstr(expand("<cWORD>"), '\v[0-9A-Za-z\-\.]+/[0-9A-Za-z\-\.]+')
    if empty(s:repo)
        echo "GoGithub: No repository found."
    else
        let s:url = 'https://github.com/' . s:repo
        call netrw#BrowseX(s:url, 0)
    end
endfunction
autocmd FileType *vim,*zsh,*bash,*tmux nnoremap <buffer> <silent> <cr> :call <sid>go_github()<cr>

"key maps
noremap ; :
cnoremap <C-a> <Home>
cnoremap <C-e> <end>

" use space as map leader
let mapleader = " "
let g:mapleader = " "

"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" split window jump
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Go to home and end using capitalized directions
noremap H ^
noremap L $

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

"copy and paste from clipboard
nmap Y "+y
nmap P "+p

nmap <leader>h :History<CR>
nmap <leader>/ :execute "Rg "."<C-r><C-w>"<CR>
nmap <leader>l :Lines<CR>
nmap <leader>p :Wd<CR>
nmap <leader>f :Files<CR>
nmap <leader>n :NERDTreeToggle<CR>

nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>k <Plug>(coc-document)
