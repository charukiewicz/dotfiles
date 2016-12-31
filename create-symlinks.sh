#!/bin/bash

# This script will create symlinks between the main dotfiles in this repository
# and their correct locations in ~/

CURR_DIR=$(pwd)
cd ~
ln -s $CURR_DIR/vim/vimrc .vimrc
ln -s $CURR_DIR/tmux/tmux.conf .tmux.conf
ln -s $CURR_DIR/bash/bash.bashrc .bashrc
