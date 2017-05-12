nmap <leader>h :CtrlPMRUFiles<CR>
nmap <leader>r :CtrlPBufTag<CR>
nmap <leader>l :CtrlPLine<CR>
nmap <leader>p :CtrlP<CR>

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


function! SearchInProjectDir(pattern)
    let cmd = 'CtrlSF '. a:pattern ." ".g:projectDir
    execute cmd
endfunc

function! ChangeProject(projectDir, ...)
    let defaultIgnoreList = ["", '".git"', '".svn"', '".hg"', '".DS_Store"', '"*.meta"']
    let projectIgnoreList = get(a:, 1, [])
    let list = defaultIgnoreList + projectIgnoreList
    let ignoreList = join(list, " --ignore ")

    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden' . ignoreList . ' -g ""'
    let g:projectDir = a:projectDir
    execute 'CtrlPClearAllCaches'
    nmap <leader>t :execute "CtrlP " . g:projectDir<CR>
    command! -nargs=* Ag call SearchInProjectDir('<args>')
endfunc
