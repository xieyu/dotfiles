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
    let g:ycm_python_binary_path = '/usr/bin/python3'
    let g:projectDir = a:projectDir
    execute 'CtrlPClearAllCaches'

    nmap <leader>t :execute "CtrlP " . g:projectDir<CR>
    command! -nargs=* Ag call SearchInProjectDir('<args>')
endfunc


command! CddotFiles :call ChangeProject("/codes/github/dotfiles", ["plugged/", "oh-my-zsh/", "zsh-autosuggestions/"])
command! Cdmri :call ChangeProject("/codes/skydata/mri", ["preview/","code_model/", '"*.docx"', '"*.sqlite3"', '"*.JPG"', '"*.log"', ".repoproject", "node_modules/"])
command! Cdaxe :call ChangeProject("/codes/skydata/axe", ["node_modules/", 'dist/'])
command! Cdcritic :call ChangeProject("/codes/github/critic", [])
command! Cddemo :call ChangeProject("/codes/demo")
command! Cdxv6 :call ChangeProject("/codes/github/xv6")
command! Cdlung :call ChangeProject("/codes/skydata/kaggle_ndsb2017-master")
command! Cdopencv :call ChangeProject("/codes/github/opencv")
command! Cdautodeploy :call ChangeProject("/codes/skydata/auto-deploy")
command! Cdlungui :call ChangeProject("/codes/skydata/lung_nodule_ui")
command! Cdlungservice :call ChangeProject("/codes/skydata/lung_nodule_service")
command! Cdflask :call ChangeProject("/codes/github/flask")
command! Cdtensorflow :call ChangeProject("/codes/github/tensorflow")
command! Cdtflearn :call ChangeProject("/codes/demo/tensorflow")
command! Cdtiff :call ChangeProject("/codes/tiff-4.1")
command! Cdtiler :call ChangeProject("/codes/skydata/tif-tiler")
command! Cdbi :call ChangeProject("/codes/skydata/bi")
command! Cdflasksocketio :call ChangeProject("/codes/github/Flask-SocketIO")
command! Cdtctservice :call ChangeProject("/codes/skydata/tct_service")
command! Cdtctui :call ChangeProject("/codes/skydata/tct_ui")
command! Cdcelery :call ChangeProject("/codes/github/celery")
command! Cdkombu :call ChangeProject("/codes/github/kombu")
command! Cdpit :call ChangeProject("/codes/skydata/pit-error-detection", ["env"])
