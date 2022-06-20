#!/bin/bash

echo "---------------------"
echo "Installing basic applications"
sudo add-apt-repository universe -y
sudo apt update
sudo apt install make gawk wget curl tmux zsh ranger htop libfuse2 ripgrep gcc g++ -y

echo "---------------------"
echo "Installing neovim"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv $PWD/nvim.appimage $HOME/.local/bin/nvim

echo "---------------------"
echo "git configs"
git config --global user.name "Ibrahim Mansoor Khalid"
git config --global user.email "ibrahimmkhalid@gmail.com"
git config --global core.editor nvim
echo "done"

echo "---------------------"
echo "adding configs to appropriate locations"
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/lib
mkdir -p $HOME/.local/share
ln -s -f $PWD/zshrc $HOME/.zshrc
ln -s -f $PWD/tmux.conf $HOME/.tmux.conf
ln -s -f $PWD/tmux.conf.local $HOME/.tmux.conf.local
ln -s -f $PWD/nvim $HOME/.config/nvim
for d in $(ls $PWD/scripts);
do
	ln -s -f $PWD/scripts/$d $HOME/.local/bin/$d;
done
ln -s -f $PWD/my-assets $HOME/.local/share/my-assets

