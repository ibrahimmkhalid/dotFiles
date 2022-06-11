#!/bin/bash

echo "---------------------"
echo "Installing basic applications"
sudo add-apt-repository universe
sudo apt install make wget curl tmux zsh ranger htop xsel xclip libfuse2 -y

echo "---------------------"
echo "Cloning into submodules"
git submodule update --init

echo "---------------------"
echo "git configs"
git config --global user.name "Ibrahim Mansoor Khalid"
git config --global user.email "ibrahimmkhalid@gmail.com"
git config --global core.editor nvim
echo "done"

echo "---------------------"
echo "adding configs to appropriate locations"
ln -s $PWD/zshrc $HOME/.zshrc
ln -s $PWD/tmux.conf $HOME/.tmux.conf
ln -s $PWD/tmux.conf.local $HOME/.tmux.conf.local
ln -s $PWD/nvim $HOME/.config/nvim
ln -s $PWD/scripts/tmux-session $HOME/.mybin/tmux-session
