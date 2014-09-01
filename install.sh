#!/bin/sh
#assumes that the repo is in ~/dotfiles
#first remove the old files
files=`find . -maxdepth 1 -name ".?*" -printf " %f"`
mydir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
for x in $files 
do 
    echo installing $x
    rm ~/"$x"
    ln -sf "$mydir"/"$x" ~/"$x"
done
rm ~/.git #easier than fixing find
xmonad --recompile && xmonad --restart
pip install --user git+git://github.com/Lokaltog/powerline
echo "copying fonts"
cp "Consolas Bold for Powerline.ttf" "Consolas for Powerline.ttf" ~/.fonts
fc-cache -vf ~/.fonts
echo "vundle"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

