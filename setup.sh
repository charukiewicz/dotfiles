#!/bin/bash

# This script will create symlinks between the main dotfiles in this repository
# and their correct locations in ~/

echo "Creating symlinks..."
CURR_DIR=$(pwd)
cd ~
ln -s $CURR_DIR/vim/vimrc .vimrc
ln -s $CURR_DIR/tmux/tmux.conf .tmux.conf
ln -s $CURR_DIR/bash/bash.bashrc .bashrc

echo "Done!"

echo "Cloning Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
