#!/bin/zsh

SCRIPT_DIR="${0:a:h}"
USE_ARCH="x86"


ln -s "$SCRIPT_DIR/.zshrc" "$HOME"
ln -s "$SCRIPT_DIR/../.config" "$HOME"
ln -s "$SCRIPT_DIR/../.git_template" "$HOME"
ln -s "$SCRIPT_DIR/../.gitconfig" "$HOME"
ln -s "$SCRIPT_DIR/../.tmux.conf" "$HOME"

if [ ! -d "$HOME/opt/" ]; then
  mkdir "$HOME/opt/"
fi

ln -s "$SCRIPT_DIR/$USE_ARCH/bin" "$HOME/opt/"
ln -s "$SCRIPT_DIR/$USE_ARCH/nvim-macos-x86_64" "$HOME/opt/"


