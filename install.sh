#!/bin/bash

echo "---------------------"
echo "Installing basic applications"
sudo add-apt-repository universe -y
sudo apt install make wget curl tmux zsh ranger htop xsel xclip libfuse2 ripgrep gcc g++ dconf-editor -y
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
echo "restoring gnome settings"
cd gnome-backup
sudo tar --extract --file gnome-icons.tar.gz -C /usr/share/icons/ --strip-components=1 --overwrite
sudo tar --extract --file gnome-themes.tar.gz -C /usr/share/themes --strip-components=1 --overwrite
dconf load /org/gnome/ < dconf-dump
cd ..


clear
echo "Steps to do"
echo "run nvim +PackerSync"
echo "run nvm ls-remote and nvm install <version>"
echo "if telescope in nvim is not working, go to $HOME/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim and run make"
echo "in nvim, run :LspInstall <language server>"
echo "in nvim, run :TSInstall <language server>"
cat gnome-backup/extensions.txt
