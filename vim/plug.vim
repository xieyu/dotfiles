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

Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

Plug 'Valloric/MatchTagAlways'
Plug 'joshdick/onedark.vim'

"async syntax check
Plug 'https://github.com/w0rp/ale.git'

" config files syntax hl
Plug 'evanmiller/nginx-vim-syntax'
Plug 'Matt-Deacalion/vim-systemd-syntax'

Plug 'mxw/vim-jsx'
Plug 'luishdez/vim-less'
Plug 'darthmall/vim-vue'

call plug#end()
