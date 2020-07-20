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

Plug 'Yggdroot/indentLine'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

let g:Lf_GtagsAutoGenerate = 1
"let g:Lf_Gtagslabel = 'native-pygments'
noremap gd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap gr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap go :<C-U><C-R>=printf("Leaderf! gtags -recall %s", "")<CR><CR>


Plug 'ivanov/vim-ipython'
Plug 'bfredl/nvim-ipy'

command! -nargs=0 RunQtConsole call jobstart("jupyter qtconsole --JupyterWidget.include_other_output=True --style=monokai")
let g:ipy_celldef = '^##' " regex for cell start and end
nmap <silent> <leader>jqt :RunQtConsole<Enter>
nmap <silent> <leader>jk :IPython<Space>--existing<Space>--no-window<Enter>
nmap <silent> <leader>jc <Plug>(IPy-RunCell)
nmap <silent> <leader>ja <Plug>(IPy-RunAll)


"utils
Plug 'scrooloose/nerdtree'
Plug 'danro/rename.vim'

"fuzzy jump and search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
source ~/.vim/configs/plug/fzf.vim

Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rhysd/git-messenger.vim'

"fuzzy seach with floating window
Plug 'liuchengxu/vim-clap'
let g:clap_layout = {'relative': 'editor'}
let g:clap_disable_run_rooter=v:true
let g:clap_theme = 'material_design_dark'
source ~/.vim/configs/plug/clap.vim

Plug 'junegunn/vim-easy-align'
Plug 'lfv89/vim-interestingwords'

"color theme
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/space-vim-theme'

Plug 'ryanoasis/vim-devicons'
source ~/.vim/configs/plug/devicons.vim

"statusbar
"Plug 'liuchengxu/eleline.vim'

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




"设置默认储存文件夹。这里表示储存在当前文档所在文件夹下的'images'文件夹下，相当于 ./images/
let g:mdip_imgdir = 'images' 
"设置默认图片名称。当图片名称没有给出时，使用默认图片名称
let g:mdip_imgname = 'image'
"设置快捷键，个人喜欢 Ctrl+p 的方式，比较直观
autocmd FileType markdown nnoremap <silent> <C-p> :call mdip#MarkdownClipboardImage()<CR>F%i

Plug 'majutsushi/tagbar'
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:headings',
        \ 'l:links',
        \ 'i:images'
    \ ]
\ }

let g:tagbar_type_dot= {
    \ 'ctagstype' : 'dot',
    \ 'kinds' : [
        \ 's:subgraphs',
        \ 'a:start',
        \ 'r:record',
    \ ]
\ }


" git
"Plug 'mhinz/vim-signify' 
Plug 'tpope/vim-fugitive'

Plug 'xieyu/vim-cd'

"grpahviz
Plug 'liuchengxu/graphviz.vim'
let g:graphviz_output_format = 'svg'
autocmd Filetype dot nnoremap <leader>c :GraphvizCompile svg<CR>
autocmd Filetype dot nnoremap <leader>r :Graphviz svg<CR>
"auto compile when save 
autocmd BufWritePost *.dot GraphvizCompile

set conceallevel=2

call plug#end()

colorscheme gruvbox
