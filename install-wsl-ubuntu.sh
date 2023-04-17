#!/bin/bash
set -e

echo "---------------------"
echo "Installing basic applications"
sudo add-apt-repository universe -y
sudo apt update
sudo apt install make gawk wget curl tmux zsh ranger htop libfuse2 ripgrep gcc g++ -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash


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

echo "---------------------"
echo "------- done --------"
echo "---------------------"
echo "Steps to do"
echo "run nvim +PackerSync"
echo "run nvm ls-remote and nvm install <version>"
echo "if telescope in nvim is not working, go to $HOME/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim and run make"
