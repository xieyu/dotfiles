call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

" code complete
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tenfyzhong/CompleteParameter.vim'

" file jumps
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" global search
Plug 'https://github.com/dyng/ctrlsf.vim.git'
Plug 'junegunn/vim-easy-align'

" themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'

Plug 'Raimondi/delimitMate'
Plug 'docunext/closetag.vim', { 'for': ['html', 'xml'] }


Plug 'mxw/vim-jsx'
Plug 'luishdez/vim-less'
Plug 'darthmall/vim-vue'
Plug 'majutsushi/tagbar'
Plug 'inkarkat/vim-ingo-library'
Plug 'linluk/vim-websearch'
Plug 'lfv89/vim-interestingwords'

" makrdown preview
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim' 

Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/PreciseJump'
Plug 'MaryHal/AceJump.vim'


Plug 'junegunn/goyo.vim'
Plug 'gabrielelana/vim-markdown'
Plug 'chase/vim-ansible-yaml'


call plug#end()
