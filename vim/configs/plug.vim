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
Plug 'junegunn/vim-easy-align'

" vim-slash provides a set of mappings for enhancing in-buffer search experience in Vim.
Plug 'junegunn/vim-slash' 
if has('timers')
  " Blink 3 times with 50ms interval
  noremap <expr> <plug>(slash-after) 'zz'.slash#blink(2, 50)
endif

" global search
Plug 'https://github.com/dyng/ctrlsf.vim.git'

" themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colorscheme"
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'


" improve indent and syntax hightlight for these filetypes
Plug 'stephpy/vim-yaml',                 {'for': 'yaml'}
Plug 'andrewstuart/vim-kubernetes',      {'for': 'yaml'}
Plug 'ekalinin/Dockerfile.vim',          {'for': 'dockerfile'}
Plug 'tmux-plugins/vim-tmux',            {'for': 'tmux' }
Plug 'pangloss/vim-javascript',          {'for': 'javascript'}
Plug 'plasticboy/vim-markdown',          {'for': 'markdown'}
Plug 'elzr/vim-json',                    {'for': 'json'}
Plug 'ap/vim-css-color',                 {'for': 'css'}
Plug 'vim-scripts/awk.vim',              {'for': 'awk'}


"text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'glts/vim-textobj-comment'
Plug 'mattn/vim-textobj-url'

"git version control
Plug 'mhinz/vim-signify' " show vcs symbol on the left side
let g:signify_sign_add          = '│'
let g:signify_sign_change       = '│'
let g:signify_sign_changedelete = '│'


call plug#end()
