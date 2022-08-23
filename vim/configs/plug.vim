" vim: ft=vim:

call plug#begin('~/.vim/plugged')
"code lint
Plug 'dense-analysis/ale'

Plug 'Yggdroot/indentLine'

Plug 'ggandor/lightspeed.nvim', {'branch': 'main'}

"utils
Plug 'scrooloose/nerdtree'


Plug 'neoclide/coc.nvim', {'branch': 'release'}

"fuzzy jump and search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'untitled-ai/jupyter_ascending.vim'

source ~/.vim/configs/plug/fzf.vim


Plug 'junegunn/vim-easy-align'
Plug 'lfv89/vim-interestingwords'

"color theme
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'

Plug 'ryanoasis/vim-devicons'
source ~/.vim/configs/plug/devicons.vim


"rust
Plug 'rust-lang/rust.vim'
Plug 'rhysd/rust-doc.vim'
let g:rust_doc#define_map_K = 0
augroup vimrc-rust
    autocmd!
    autocmd FileType rust nnoremap <buffer><silent>K :<C-u>DeniteCursorWord rust/doc<CR>
augroup END

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

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'ferrine/md-img-paste.vim' 
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

Plug 'tikhomirov/vim-glsl'


" git
"Plug 'mhinz/vim-signify' 
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

Plug 'xieyu/vim-cd'
"Plug 'xieyu/vim-codenote'

"grpahviz
Plug 'liuchengxu/graphviz.vim'
let g:graphviz_output_format = 'svg'
autocmd Filetype dot nnoremap <leader>c :GraphvizCompile svg<CR>
autocmd Filetype dot nnoremap <leader>r :Graphviz svg<CR>
"auto compile when save 
autocmd BufWritePost *.dot GraphvizCompile

set signcolumn=no
set conceallevel=2

call plug#end()

colorscheme onedark

let g:jupyter_ascending_python_executable = 'python3'
