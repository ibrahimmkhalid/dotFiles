#!/bin/bash
set -e

#install
sudo apt install dconf-editor numix-icon-theme-circle gnome-tweaks jq -y

#setups
mkdir -p $HOME/.local/share/gnome-shell/extensions
mkdir -p $HOME/.local/share/fonts

#configs
sed "s|HOME_DIR|$HOME|g" guillotine.json.tmp > guillotine.json
ln -s -f $PWD/guillotine.json $HOME/.config/guillotine.json

#fonts
mkdir tmp && cd tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip
mv *.ttf $HOME/.local/share/fonts/
cd ..
rm -rf tmp

sudo git clone https://github.com/theory-of-everything/everforest-gtk /usr/share/themes/everforest-gtk

#install extensions
sudo rm -rf /usr/share/gnome-shell/extensions/*
wget -N -q "https://raw.githubusercontent.com/ToasterUwU/install-gnome-extensions/master/install-gnome-extensions.sh" -O ./extensions/install-gnome-extensions.sh
chmod +x extensions/install-gnome-extensions.sh 
./extensions/install-gnome-extensions.sh --enable --file extensions/links.txt
rm -f ./extensions/install-gnome-extensions.sh 

#gnome settings
dconf load /org/gnome/ < org-gnome.dconf.dump
gsettings set org.gnome.desktop.background picture-uri file:////$PWD/wallpaper/wallpaper.png
gsettings set org.gnome.desktop.screensaver picture-uri file:////$PWD/wallpaper/wallpaper.png
