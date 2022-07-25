#!/bin/bash

echo "---------------------"
echo "Installing basic applications"
sudo add-apt-repository universe -y
sudo apt update
sudo apt install make gawk wget curl tmux zsh ranger htop libfuse2 ripgrep gcc g++ -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

echo "---------------------"
echo "Installing neovim"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv $PWD/nvim.appimage $HOME/.local/bin/nvim


echo "---------------------"
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "---------------------"
echo "Cloning into submodules"
git submodule update --init
cd nvim
git remote add upstream https://github.com/AstroNvim/AstorNvim
cd ..

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

clear
echo "Steps to do"
echo "run nvim +PackerSync"
echo "run nvm ls-remote and nvm install <version>"
echo "if telescope in nvim is not working, go to $HOME/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim and run make"
echo "in nvim, run :LspInstall <language server>"
echo "in nvim, run :TSInstall <language server>"
