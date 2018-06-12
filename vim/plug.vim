call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'https://github.com/dyng/ctrlsf.vim.git'
Plug 'junegunn/vim-easy-align'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Raimondi/delimitMate'
Plug 'docunext/closetag.vim', { 'for': ['html', 'xml'] }

"Plug 'Valloric/YouCompleteMe'
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

Plug 'Valloric/MatchTagAlways'
Plug 'joshdick/onedark.vim'

Plug 'jaimecp89/vim-eink'

"async syntax check
Plug 'https://github.com/w0rp/ale.git'

" config files syntax hl
Plug 'evanmiller/nginx-vim-syntax'
Plug 'Matt-Deacalion/vim-systemd-syntax'

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

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tenfyzhong/CompleteParameter.vim'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'gabrielelana/vim-markdown'


call plug#end()
