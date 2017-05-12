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


command! CddotFiles :call ChangeProject("/codes/github/dotfiles", ["plugged/", "oh-my-zsh/", "zsh-autosuggestions/"])
command! Cdmri :call ChangeProject("/codes/skydata/mri", ["preview/","code_model/", '"*.docx"', '"*.sqlite3"', '"*.JPG"', '"*.log"', ".repoproject", "node_modules/"])
command! Cdaio :call ChangeProject("/codes/skydata/aio", ["node_modules/","static/", 'build/'])
command! Cdcritic :call ChangeProject("/codes/github/critic", [])
command! Cddemo :call ChangeProject("/codes/demo")
