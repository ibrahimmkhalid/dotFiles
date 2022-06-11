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
ln -s -f $PWD/zshrc $HOME/.zshrc
ln -s -f $PWD/tmux.conf $HOME/.tmux.conf
ln -s -f $PWD/tmux.conf.local $HOME/.tmux.conf.local
ln -s -f $PWD/nvim $HOME/.config/nvim
ln -s -f $PWD/scripts/tmux-session $HOME/.mybin/tmux-session

echo "---------------------"
echo "downloading firacode"
mkdir tmp && cd tmp
wget https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip
unzip Fira_Code_v6.2.zip
cd ttf
mkdir -p $HOME/tmp/.local/share/fonts
mv *.ttf $HOME/tmp/.local/share/fonts/
cd ../..
rm -rf tmp
