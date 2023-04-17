#!/bin/bash
set -e

echo "---------------------"
echo "Installing basic applications"
sudo add-apt-repository universe -y
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt update
sudo apt install make gawk wget curl tmux zsh ranger htop libfuse2 ripgrep gcc g++ -y
sudo apt install xsel xclip dconf-editor numix-icon-theme-circle alacritty gnome-tweaks -y
sudo apt install -y curl wget jq unzip

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/lib
mkdir -p $HOME/.local/share

echo "---------------------"
echo "Installing neovim"
curl -LO https://github.com/neovim/neovim/releases/download/v0.9.0/nvim.appimage
chmod u+x nvim.appimage
mv $PWD/nvim.appimage $HOME/.local/bin/nvim

echo "---------------------"
echo "Installing lazygit"
mkdir tmp && cd tmp
curl -LO https://github.com/jesseduffield/lazygit/releases/download/v0.35/lazygit_0.35_Linux_x86_64.tar.gz
tar xzf lazygit_0.35_Linux_x86_64.tar.gz
mv $PWD/lazygit $HOME/.local/bin/lazygit
cd ..
rm -rf tmp

echo "---------------------"
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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
for d in $(ls $PWD/scripts);
do
  ln -s -f $PWD/scripts/$d $HOME/.local/bin/$d;
done
ln -s -f $PWD/my-assets $HOME/.local/share/my-assets

mkdir -p $HOME/.local/share/gnome-shell/extensions
mkdir -p $HOME/.local/share/fonts
mkdir -p $HOME/.config/alacritty
sed "s|HOME_DIR|$HOME|g" guillotine.json.tmp > guillotine.json
ln -s -f $PWD/alacritty.yml $HOME/.config/alacritty/alacritty.yml
ln -s -f $PWD/guillotine.json $HOME/.config/guillotine.json

echo "---------------------"
echo "downloading firacode"
mkdir tmp && cd tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip
rm *Windows*
rm Fura*
rm *.otf
mv *.ttf $HOME/.local/share/fonts/
cd ..
rm -rf tmp

echo "---------------------"
echo "restoring gnome settings"

mkdir tmp && cd tmp
wget https://github.com/EliverLara/Nordic/releases/latest/download/Nordic-Polar-v40.tar.xz
wget https://github.com/EliverLara/Nordic/releases/latest/download/Nordic-Polar.tar.xz
tar xvf Nordic-Polar-v40.tar.xz
tar xvf Nordic-Polar.tar.xz
sudo mv Nordic-Polar-v40 /usr/share/themes
sudo mv Nordic-Polar /usr/share/themes
cd ..
rm -rf tmp

sudo rm -rf /usr/share/gnome-shell/extensions/*
wget -N -q "https://raw.githubusercontent.com/cyfrost/install-gnome-extensions/master/install-gnome-extensions.sh" -O ./extensions/install-gnome-extensions.sh
chmod +x extensions/install-gnome-extensions.sh 
./extensions/install-gnome-extensions.sh --enable --file extensions/links.txt
rm -f ./extensions/install-gnome-extensions.sh 

dconf load /org/gnome/ < org-gnome.dconf.dump

gsettings set org.gnome.desktop.background picture-uri file:////$PWD/wallpaper/wallpaper.png
gsettings set org.gnome.desktop.screensaver picture-uri file:////$PWD/wallpaper/wallpaper.png
rm -rf tmp

echo "---------------------"
echo "------- done --------"
echo "---------------------"
echo "Steps to do"
echo "run nvim +PackerSync"
echo "run nvm ls-remote and nvm install <version>"
echo "if telescope in nvim is not working, go to $HOME/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim and run make"
