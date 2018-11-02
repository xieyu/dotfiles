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
    \ 'python': ['pyls', '-v',  '-v', '--log-file=/tmp/pyls.log'],
    \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'c': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'go': ["go-langserver"],
    \ }

let g:LanguageClient_rootMarkers = {
    \ 'rust': ['Cargo.toml'],
    \ 'python': ['.root'],
    \ }

let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = '~/.config/nvim/settings.json'

nn <silent> K :call LanguageClient#textDocument_hover()<CR>
nn <silent> gd :call LanguageClient#textDocument_definition()<CR>
nn <silent> gt :call LanguageClient#textDocument_typeDefinition()<cr>
nn <silent> gh :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'L'})<cr>
nn <silent> gj :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'D'})<cr>
nn <silent> gk :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'U'})<cr>
nn <silent> gl :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'R'})<cr>


" find all locations for type vars
nn <silent> gv :call LanguageClient#findLocations({'method':'$ccls/vars'})<cr>
nn <silent> gV :call LanguageClient#findLocations({'method':'$ccls/vars','kind':1})<cr>

" base class
nn <silent> gB :call LanguageClient#findLocations({'method':'$ccls/inheritanceHierarchy','flat':v:true,'levels':3,'derived':v:false})<cr>
" derived of up to 3 levels
nn <silent> gD :call LanguageClient#findLocations({'method':'$ccls/inheritanceHierarchy','flat':v:true,'levels':3,'derived':v:true})<cr>
nn <silent> gc :call LanguageClient#findLocations({'method':'$ccls/callers'})<cr>
nn <silent> gm :call LanguageClient#findLocations({'method':'$ccls/memberHierarchy','flat':v:true})<cr>

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:deoplete#sources#tss#javascript_support = 1
let g:neomake_javascript_enabled_makers = ['eslint']

let g:ale_linters= {
\   'javascript': ['standard'],
\}
let g:ale_linters_explicit=1
let g:ale_fixers = {'javascript': ['standard']}

colorscheme gruvbox
