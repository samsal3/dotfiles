#!/bin/zsh

SCRIPT_DIR=${0:a:h}

ln -s $SCRIPT_DIR/macOS/.zshrc $HOME
ln -s $SCRIPT_DIR/editors/.vim $HOME

ln -s $SCRIPT_DIR/other/.git_template $HOME
ln -s $SCRIPT_DIR/other/.gitconfig $HOME
