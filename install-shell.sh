#!/bin/bash
set -e

#install
sudo add-apt-repository universe -y
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt update
sudo apt install make gawk wget curl tmux zsh ranger htop libfuse2 ripgrep gcc g++ unzip neofetch tldr lldb entr fzf xsel xclip -y

#setups
git config --global user.name "Ibrahim Mansoor Khalid"
git config --global user.email "ibrahimmkhalid@gmail.com"
git config --global core.editor nvim
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/lib
mkdir -p $HOME/.local/share

#tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

#node version manager
nvm_version=$(curl -s https://raw.githubusercontent.com/nvm-sh/nvm/master/README.md | grep -o 'nvm/v[0-9]*\.[0-9]*\.[0-9]*' | grep -o 'v[0-9]*\.[0-9]*\.[0-9]*' | head -1)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$nvm_version/install.sh | bash

#neovim
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
mv $PWD/nvim.appimage $HOME/.local/bin/nvim

#lazy git
mkdir tmp && cd tmp
curl -LO https://github.com/jesseduffield/lazygit/releases/download/v0.37/lazygit_0.37_Linux_x86_64.tar.gz
tar xzf lazygit_0.37_Linux_x86_64.tar.gz
mv $PWD/lazygit $HOME/.local/bin/lazygit
cd ..
rm -rf tmp

#zsh theme, ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#configs
ln -s -f $PWD/zshrc $HOME/.zshrc
ln -s -f $PWD/tmux $HOME/.config/tmux
ln -s -f $PWD/nvim $HOME/.config/nvim
for d in $(ls $PWD/scripts);
do
  ln -s -f $PWD/scripts/$d $HOME/.local/bin/$d;
done
