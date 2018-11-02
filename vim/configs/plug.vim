" vim: ft=vim:

call plug#begin('~/.vim/plugged')

" file tree and tag bar
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
nmap <C-\> :NERDTreeToggle<CR>
" Quit when nerdtree is the only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}} scrooloose/nerdtree "


Plug 'majutsushi/tagbar'

Plug 'MattesGroeger/vim-bookmarks'

" code complete
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }



Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

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


Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesToggle' }
let g:indentLine_enabled = 0
" autocmd Filetype *yaml,*xml,c,cpp,go,rust,java let g:indentLine_enabled = 1
autocmd Filetype json,markdown let g:indentLine_setConceal = 0
let g:indentLine_char = '│'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#4E4E4E'
map <leader>il :IndentLinesToggle<CR>
" }}} Yggdroot/indentLine "

" themes
Plug 'ryanoasis/vim-devicons'
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*vim_.*\|.*vimrc.*'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*zsh_.*\|.*zshrc.*'] = ''

"air powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'


let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_alt_sep = ''


" colorscheme"
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'


" improve indent and syntax hightlight for these filetypes
Plug 'stephpy/vim-yaml',                 {'for': 'yaml'}
Plug 'andrewstuart/vim-kubernetes',      {'for': 'yaml'}
Plug 'ekalinin/Dockerfile.vim',          {'for': 'dockerfile'}
Plug 'tmux-plugins/vim-tmux',            {'for': 'tmux' }
Plug 'plasticboy/vim-markdown',          {'for': 'markdown'}
Plug 'elzr/vim-json',                    {'for': 'json'}
Plug 'ap/vim-css-color',                 {'for': 'css'}
Plug 'vim-scripts/awk.vim',              {'for': 'awk'}

Plug 'danro/rename.vim'

"text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'glts/vim-textobj-comment'
Plug 'mattn/vim-textobj-url'

Plug 'bfrg/vim-cpp-modern'
Plug 'derekwyatt/vim-scala'
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}

Plug 'w0rp/ale'

Plug 'carlitux/deoplete-ternjs'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
"Plug 'pangloss/vim-javascript',          {'for': 'javascript'}


"Typescript Plugins
"Plug 'Shougo/vimproc.vim', { 'do': 'make' }
"Plug 'Quramy/tsuquyomi', { 'do': 'npm install -g typescript' }
"Plug 'mhartington/deoplete-typescript'



"git version control
"
"show vcs symbol on the left side
Plug 'mhinz/vim-signify' 
let g:signify_sign_add          = '│'
let g:signify_sign_change       = '│'
let g:signify_sign_changedelete = '│'

Plug 'tpope/vim-fugitive'
nmap [q :cprev<CR>
nmap ]q :cnext<CR>
nmap [Q :cfirst<CR>
nmap ]Q :clast<CR>
nmap <Leader>d :Gdiff<CR>

call plug#end()


"open plug github repo in browser by press enter
function! s:go_github()
    let s:repo = matchstr(expand("<cWORD>"), '\v[0-9A-Za-z\-\.]+/[0-9A-Za-z\-\.]+')
    if empty(s:repo)
        echo "GoGithub: No repository found."
    else
        let s:url = 'https://github.com/' . s:repo
        call netrw#BrowseX(s:url, 0)
    end
endfunction
autocmd FileType *vim,*zsh,*bash,*tmux nnoremap <buffer> <silent> <cr> :call <sid>go_github()<cr>
