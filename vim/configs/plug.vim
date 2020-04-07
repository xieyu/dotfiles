" vim: ft=vim:

call plug#begin('~/.vim/plugged')

"code complete, snip
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
source ~/.vim/configs/plug/coc.vim
" snippets
Plug 'honza/vim-snippets'

"code lint
Plug 'dense-analysis/ale'

"build system
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
let g:asyncrun_open = 6


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
Plug 'lfv89/vim-interestingwords'

"color theme
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'

Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
source ~/.vim/configs/plug/airline.vim
source ~/.vim/configs/plug/devicons.vim


"rust
Plug 'rust-lang/rust.vim'
Plug 'rhysd/rust-doc.vim'

"go
Plug 'fatih/vim-go'

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
