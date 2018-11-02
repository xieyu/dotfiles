#!/bin/bash
set -x
# get the dir of the current script
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) && cd "$SCRIPT_DIR" || return 1

mkdir -p ~/.vim/spell ~/.config

ln -sf  "$SCRIPT_DIR/vimrc.vim"              ~/.vimrc
ln -s  "$SCRIPT_DIR/configs"              ~/.vim/configs
ln -s  "$SCRIPT_DIR/autoload"              ~/.vim/autoload
ln -sf  "$SCRIPT_DIR/projects.vim"              ~/.vim/projects.vim
ln -sf  "$SCRIPT_DIR/settings.json"              ~/.config/nvim/settings.json

# Install plugins managed by vim-plug
# `tty &>/dev/null` is to make sure the script is run from a tty(ie, not ssh)
tty &>/dev/null && vim +PlugInstall +qall

# nvim
if hash nvim &>/dev/null ; then
    ln -snf ~/.vim   ~/.config/nvim
    ln -sf  ~/.vimrc ~/.config/nvim/init.vim
    #hash gem  &>/dev/null && gem install neovim
    hash pip2 &>/dev/null && pip2 install --upgrade neovim
    hash pip3 &>/dev/null && pip3 install --upgrade neovim
    tty &>/dev/null && nvim +PlugInstall +qall
fi

# For tags
# pip install --upgrade pygments

# For vim-keysound
# sudo yaourt -S sdl sdl2_mixer
# pip install --upgrade pysdl2
