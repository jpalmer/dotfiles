#!/bin/sh
#assumes that the repo is in ~/dotfiles
#first remove the old files
files=".Xdefaults .bashrc .vim .vimrc .xinitrc .xmobarrc .xmonad"
mydir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
for x in $files 
do 
    echo installing $x
    rm ~/"$x"
    ln -sf "$mydir"/"$x" ~/"$x"
done
xmonad --recompile && xmonad --restart
