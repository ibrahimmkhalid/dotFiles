#!/bin/bash
set -e

#install
sudo apt install dconf-cli dconf-editor numix-icon-theme-circle gnome-tweaks gnome-terminal -y

#fonts
mkdir -p $HOME/.local/share/fonts
mkdir tmp && cd tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip
mv *.ttf $HOME/.local/share/fonts/
cd ..
rm -rf tmp

sudo git clone https://github.com/theory-of-everything/everforest-gtk /usr/share/themes/everforest-gtk

#gnome settings
dconf load /org/gnome/ < org-gnome.dconf.dump
