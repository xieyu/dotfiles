" vim: ft=vim:

call plug#begin('~/.vim/plugged')

"utils
Plug 'scrooloose/nerdtree'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'danro/rename.vim'

" code complete and lint
"Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
"Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}


"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"let g:deoplete#enable_at_startup = 1

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
Plug 'edkolev/tmuxline.vim'


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
Plug 'tmux-plugins/vim-tmux',            {'for': 'tmux' }
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

call plug#end()

" plugin configs
source ~/.vim/configs/plug/language-client.vim
source ~/.vim/configs/plug/fzf.vim
source ~/.vim/configs/plug/airline.vim
source ~/.vim/configs/plug/devicons.vim
source ~/.vim/configs/plug/ale.vim

colorscheme gruvbox
let g:rustfmt_autosave = 1
