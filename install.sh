#!/bin/sh
#assumes that the repo is in ~/dotfiles
#first remove the old files
rm ~/.bashrc ~/.vimrc
rm -rf ~/.vim
#now use soft links to use the files from the repo
ln -sf dotfiles/.bashrc ~/.bashrc
ln -sf dotfiles/.vimrc ~/.vimrc
ln -sf dotfiles/.vim ~/.vim
