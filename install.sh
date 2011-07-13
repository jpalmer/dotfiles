rm ~/.bashrc ~/.vimrc
rm -rf ~/.vim
git reset --hard #incase stuff got deleted
ln -s .bashrc ~/.bashrc
ln -s .vimrc ~/.vimrc
ln -s .vim ~/.vim
