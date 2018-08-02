set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"

"ctrlfs
let g:ctrlsf_position = 'bottom'
let g:web_search_browser='open -a "/Applications/Google Chrome.app"'


"lsp-client
"set hidden
let g:deoplete#enable_at_startup = 1

let g:LanguageClient_autoStart = 1
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

colorscheme gruvbox
