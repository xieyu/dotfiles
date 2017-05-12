command! Cdmri :call ChangeProject("/codes/skydata/mri", ["preview/","code_model/", '"*.docx"', '"*.sqlite3"', '"*.JPG"', '"*.log"', ".repoproject", "node_modules/"])
command! Cdaio :call ChangeProject("/codes/skydata/aio", ["node_modules/","static/", 'build/'])
command! CddotFiles :call ChangeProject("/codes/github/dotfiles", ["plugged/", "oh-my-zsh/", "zsh-autosuggestions/"])
