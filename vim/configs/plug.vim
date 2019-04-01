" vim: ft=vim:

call plug#begin('~/.vim/plugged')

"utils
Plug 'scrooloose/nerdtree'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'danro/rename.vim'

" code complete and lint
"Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
"Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"let g:deoplete#enable_at_startup = 1
"Plug 'liuchengxu/vista.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'junegunn/vim-easy-align'

Plug 'rust-lang/rust.vim'

"markdwn preview
Plug 'iamcco/markdown-preview.vim'

" vim-slash provides a set of mappings for enhancing in-buffer search experience in Vim.
Plug 'junegunn/vim-slash' 

Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesToggle' }

Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" colorscheme"
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'

" improve indent and syntax hightlight for these filetypes
Plug 'uarun/vim-protobuf'
Plug 'uber/prototool', { 'rtp':'vim/prototool' }
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml',                 {'for': 'yaml'}
Plug 'andrewstuart/vim-kubernetes',      {'for': 'yaml'}
Plug 'ekalinin/Dockerfile.vim',          {'for': 'dockerfile'}
Plug 'plasticboy/vim-markdown',          {'for': 'markdown'}
Plug 'elzr/vim-json',                    {'for': 'json'}
Plug 'ap/vim-css-color',                 {'for': 'css'}
Plug 'vim-scripts/awk.vim',              {'for': 'awk'}
Plug 'bfrg/vim-cpp-modern'
Plug 'derekwyatt/vim-scala'
Plug 'fatih/vim-go'


" git
Plug 'mhinz/vim-signify' 
Plug 'tpope/vim-fugitive'

" logcat
Plug 'embear/vim-foldsearch'
Plug 'andreshazard/vim-logreview'

Plug 'xieyu/vim-codenote'
"Plug 'jacobsimpson/nvim-example-python-plugin'

call plug#end()

" plugin configs
"source ~/.vim/configs/plug/language-client.vim
source ~/.vim/configs/plug/fzf.vim
source ~/.vim/configs/plug/airline.vim
source ~/.vim/configs/plug/devicons.vim
"source ~/.vim/configs/plug/ale.vim
source ~/.vim/configs/plug/coc.vim

colorscheme gruvbox
let g:rustfmt_autosave = 1
"let g:bookmark_save_per_working_dir=1
