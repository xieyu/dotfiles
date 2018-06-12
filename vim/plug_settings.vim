"ctrlp
nmap <leader>h :CtrlPMRUFiles<CR>
nmap <leader>r :CtrlPBufTag<CR>
nmap <leader>l :CtrlPLine<CR>
nmap <leader>p :CtrlP<CR>
nmap <leader>j :CtrlSFToggle<CR>

let g:ctrlp_working_path_mode='ra'
let g:ctrlp_map = '<leader>p'
let g:ctrlp_match_window_bottom=1
let g:ctrlp_match_window_reversed=0
let g:ctrlp_max_height=15
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|meta|asset|fbx|psd|png|jpeg)$',
    \ }

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "*.*.meta"
      \ --ignore "*.meta"
      \ --ignore "*.unity"
      \ --ignore "*.psd"
      \ --ignore "*.png"
      \ --ignore "*.fbx"
      \ --ignore "**/*.pyc"
      \ -g ""'


"airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
  

"ale
let g:ale_python_pylint_executable = 'pylint'   " or 'python' for Python 2

"jsx
let g:jsx_ext_required = 0

"ycm
let g:ycm_python_binary_path='python3'


"ctrlfs
let g:ctrlsf_position = 'bottom'
let g:web_search_browser='open -a "/Applications/Google Chrome.app"'



"lsp-client
"set hidden
let g:deoplete#enable_at_startup = 1


let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'python': ['pyls', '-v',  '-v', '--log-file=/tmp/pyls.log'],
    \ }

let g:LanguageClient_rootMarkers = {
    \ 'javascript': ['project.json'],
    \ 'rust': ['Cargo.toml'],
    \ 'python': ['.root'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:fzf_tags_command = 'ctags -R'

nmap <leader>t :execute "FZF"<CR>
nmap <leader>l :execute "Lines" <CR>
nmap <leader>h :execute "History" <CR>
