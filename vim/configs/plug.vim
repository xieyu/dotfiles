" vim: ft=vim:

call plug#begin('~/.vim/plugged')

"code complete, snip
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
source ~/.vim/configs/plug/coc.vim
Plug 'fatih/vim-go'


"code lint
Plug 'dense-analysis/ale'


"utils
Plug 'scrooloose/nerdtree'
Plug 'danro/rename.vim'


"fuzzy jump and search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
source ~/.vim/configs/plug/fzf.vim

"fuzzy seach with floating window
Plug 'liuchengxu/vim-clap'
source ~/.vim/configs/plug/clap.vim

"fuzzy search with gtags and function search
Plug 'Yggdroot/LeaderF'
source ~/.vim/configs/plug/leaderf.vim


Plug 'junegunn/vim-easy-align'

"color theme
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'


Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
source ~/.vim/configs/plug/airline.vim
source ~/.vim/configs/plug/devicons.vim


" improve indent and syntax hightlight for these filetypes
Plug 'rust-lang/rust.vim'
Plug 'uarun/vim-protobuf'
Plug 'uber/prototool', { 'rtp':'vim/prototool' }
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml',                 {'for': 'yaml'}
Plug 'andrewstuart/vim-kubernetes',      {'for': 'yaml'}
Plug 'ekalinin/Dockerfile.vim',          {'for': 'dockerfile'}
Plug 'elzr/vim-json',                    {'for': 'json'}
Plug 'ap/vim-css-color',                 {'for': 'css'}
Plug 'vim-scripts/awk.vim',              {'for': 'awk'}
Plug 'bfrg/vim-cpp-modern'
Plug 'derekwyatt/vim-scala'
Plug 'nickhutchinson/vim-systemtap'
Plug 'florentc/vim-tla'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" git
Plug 'mhinz/vim-signify' 
Plug 'tpope/vim-fugitive'

"Plug 'xieyu/vim-codenote'
Plug 'xieyu/vim-cd'

"grpahviz
Plug 'wannesm/wmgraphviz.vim'
let g:mkdp_auto_close = 0
let g:WMGraphviz_output="svg"
abbre gs GraphvizShow
abbre gc GraphvizCompile

set conceallevel=2

call plug#end()

colorscheme gruvbox
