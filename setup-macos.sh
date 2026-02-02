#!/bin/zsh

SCRIPT_DIR=${0:a:h}

ln -s $SCRIPT_DIR/macOS/.zshrc $HOME
ln -s $SCRIPT_DIR/.config $HOME
ln -s $SCRIPT_DIR/.git_template $HOME
ln -s $SCRIPT_DIR/.gitconfig $HOME
ln -s $SCRIPT_DIR/.tmux.conf $HOME
