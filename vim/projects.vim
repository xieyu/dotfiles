function! SearchInProjectDir(pattern)
    let cmd = 'CtrlSF -C 0 '. a:pattern . " " . g:projectDir
    execute cmd
endfunc

function! ChangeProject(projectDir, ...)
    let defaultIgnoreList = ["", '".git"', '".svn"', '".hg"', '".DS_Store"', '"*.meta"', '"*.rpm"']
    let projectIgnoreList = get(a:, 1, [])
    let list = defaultIgnoreList + projectIgnoreList
    let ignoreList = join(list, " --ignore ")


    let g:ycm_python_binary_path = '/usr/bin/python3'
    let g:projectDir = a:projectDir
    let g:ctrlsf_default_root = a:projectDir
    let $FZF_DEFAULT_COMMAND = 'ag %s -i --nocolor --nogroup --hidden' . ignoreList . ' -g "" '. g:projectDir

    nmap <leader>t :execute "FZF" . g:projectDir<CR>
    nmap <leader>f :execute "CtrlSF -C 0 "."<C-r><C-w> " .g:projectDir<CR>
endfunc


command! CddotFiles :call ChangeProject("/codes/github/dotfiles", ["plugged/", "oh-my-zsh/", "zsh-autosuggestions/"])
command! Cdmri :call ChangeProject("/codes/skydata/mri", ["preview/","code_model/", '"*.docx"', '"*.sqlite3"', '"*.JPG"', '"*.log"', ".repoproject", "node_modules/"])
command! Cdaxev2 :call ChangeProject("/codes/skydata/axe/src/apps/v2", ["node_modules/", 'dist/', "conda-pkgs", '"*.pyc"'])
command! Cdaxe :call ChangeProject("/codes/skydata/axe", ["node_modules/", 'dist/', "conda-pkgs", '"*.pyc"', "builds/"])
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
command! Cdtflearn :call ChangeProject("/codes/demo/tf-learn")
command! Cdtf :call ChangeProject("/codes/github/tensorflow")
command! Cdwindpower :call ChangeProject("/codes/skydata/wind-power")
command! Cdbosen :call ChangeProject("/codes/petuum/bosen")
command! Cdposeidon :call ChangeProject("/codes/skydata/poseidon-obfuscate", ["pkgs/", "purelib"])
command! Cdzabbix :call ChangeProject("/codes/skydata/zabbix-mysql-web")
command! Cdsqlalchemy :call ChangeProject("/usr/local/lib/python3.6/site-packages/sqlAlchemy")
command! Cdnotebook :call ChangeProject("/codes/github/notebook")
command! Cdplayground :call ChangeProject("/codes/github/playground")
command! Cdflaskpymongo :call ChangeProject("/codes/github/flask-pymongo")
command! Cddocker :call ChangeProject("/codes/github/docker")
command! Cdjupytertensorboard :call ChangeProject("/codes/github/jupyter_tensorboard")
command! Cdunreal :call ChangeProject("/codes/github/UnrealEngine/Engine/Source/Runtime")
command! Cdtfserv  :call ChangeProject("/codes/github/serving")
command! Cdkfb :call ChangeProject("/codes/skydata/kfb")
command! Cdflaskclassy :call ChangeProject("/codes/github/flask-classy")
command! Cdpymodm :call ChangeProject("/codes/github/pymodm")
command! Cdmetro :call ChangeProject("/codes/skydata/metro")
command! Cdskyflow :call ChangeProject("/codes/skydata/skyflow")
command! Cdwebargs :call ChangeProject("/codes/github/webargs")
command! Cdkeras :call ChangeProject("/codes/github/keras")
command! Cdtctmodel :call ChangeProject("/codes/skydata/TCT_versionII")
command! Cdpyls :call ChangeProject("/codes/github/python-language-server")
command! Cdspacy :call ChangeProject("/codes/github/spaCy", ['"*.pyc"', ".github/"])
command! Cdthinc :call ChangeProject("/codes/github/thinc", ['"*.pyc"', ".github/"])
command! Cdecon :call ChangeProject("/codes/skydata/SkyEconServer2", ['"*.pyc"', ".github/"])
