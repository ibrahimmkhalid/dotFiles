#!/bin/bash

echo "---------------------"
echo "Installing basic applications"
sudo add-apt-repository universe -y
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt update
sudo apt install make gawk wget curl tmux zsh ranger htop xsel xclip libfuse2 ripgrep gcc g++ dconf-editor numix-icon-theme-circle alacritty -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

echo "---------------------"
echo "Installing neovim"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mkdir -p $HOME/.mybin/source
mv $PWD/nvim.appimage $HOME/.mybin/source
ln -s $HOME/.mybin/source/nvim.appimage $HOME/.mybin/nvim


echo "---------------------"
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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
ln -s -f $PWD/scripts/diskUse $HOME/.mybin/diskUse

echo "---------------------"
echo "downloading firacode"
mkdir tmp && cd tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip
rm *Windows*
rm Fura*
rm *.otf
mkdir -p $HOME/.local/share/fonts
mv *.ttf $HOME/.local/share/fonts/
cd ..
rm -rf tmp

echo "---------------------"
echo installing gnome extensions
function regex1tmp(){ gawk 'match($0,/'$1'/, ary) {print ary['${2:-'1'}']}'; }
mkdir tmp && cd tmp
mkdir -p $HOME/.local/share/gnome-shell/extensions

echo "---------------------"
echo "restoring gnome settings"
mkdir tmp && cd tmp
wget https://github.com/EliverLara/Nordic/releases/download/v2.1.0/Nordic-Polar-v40.tar.xz
wget https://github.com/EliverLara/Nordic/releases/download/v2.1.0/Nordic-Polar.tar.xz
tar xvf Nordic-Polar-v40.tar.xz
tar xvf Nordic-Polar.tar.xz
sudo mv Nordic-Polar-v40 /usr/share/themes
sudo mv Nordic-Polar /usr/share/themes
cd ..
rm -rf tmp

dconf load /org/gnome/ < org-gnome.dconf.dump 
cd ..

declare -a extensionStrings=(
"https://extensions.gnome.org/extension-data/todolisttomMoral.org.v12.shell-extension.zip"
"https://extensions.gnome.org/extension-data/user-themegnome-shell-extensions.gcampax.github.com.v44.shell-extension.zip"
"https://extensions.gnome.org/extension-data/guillotinefopdoodle.net.v15.shell-extension.zip"
"https://extensions.gnome.org/extension-data/dash-to-dockmicxgx.gmail.com.v71.shell-extension.zip"
"https://extensions.gnome.org/extension-data/caffeinepatapon.info.v39.shell-extension.zip"
"https://extensions.gnome.org/extension-data/clipboard-indicatortudmotu.com.v38.shell-extension.zip"
"https://extensions.gnome.org/extension-data/appindicatorsupportrgcjonas.gmail.com.v42.shell-extension.zip"
)

for ext in "${extensionStrings[@]}"; do
	curl $ext --output extension.zip
  unzip extension.zip -d extension
	mv extension $HOME/.local/share/gnome-shell/extensions/$(cat extension/metadata.json|grep uuid|regex1tmp '^.*".*".*"(.*)".*$')
done

cd ..
rm -rf tmp


clear
echo "Steps to do"
echo "run nvim +PackerSync"
echo "run nvm ls-remote and nvm install <version>"
echo "if telescope in nvim is not working, go to $HOME/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim and run make"
echo "in nvim, run :LspInstall <language server>"
echo "in nvim, run :TSInstall <language server>"
