#!/bin/sh
function makeSymLink() {
    if [ ! -e $2 ];then
        ln -s $1 $2
        echo "Create $1 to $2 symbolic link."
    fi
}

DROPBOX_DIR="$HOME/Dropbox/dotfiles"

makeSymLink $DROPBOX_DIR/tmux/.tmux.conf  ~/.tmux.conf
makeSymLink $DROPBOX_DIR/tmux/.tmux  ~/.tmux
makeSymLink $DROPBOX_DIR/zsh/.zshrc ~/.zshrc
makeSymLink $DROPBOX_DIR/ssh         ~/.ssh
makeSymLink $DROPBOX_DIR/.gitconfig  ~/.gitconfig
makeSymLink $DROPBOX_DIR/.gitignore_global ~/.gitignore_global
makeSymLink $DROPBOX_DIR/nvim  ~/.config/nvim
