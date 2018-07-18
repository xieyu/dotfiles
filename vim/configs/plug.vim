call plug#begin('~/.vim/plugged')

" file tree and tag bar
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'

" code complete
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tenfyzhong/CompleteParameter.vim'

" file jumps
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" global search
Plug 'https://github.com/dyng/ctrlsf.vim.git'
Plug 'junegunn/vim-easy-align'

" themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colorscheme {{{"
Plug 'joshdick/onedark.vim'
Plug 'junegunn/seoul256.vim'
colorscheme onedark
"}}}"

"nvim terminal
Plug 'mklabs/split-term.vim'
Plug 'viniarck/fzf-tabs.nvim'

call plug#end()
