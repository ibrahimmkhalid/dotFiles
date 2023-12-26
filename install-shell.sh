#!/bin/bash
set -e

#install
sudo add-apt-repository universe -y
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt update
sudo apt install make gawk wget curl ranger htop libfuse2 ripgrep gcc g++ unzip neofetch tldr lldb entr fzf xsel xclip python3 python-is-python3 python3-pip build-essential python3-venv ansible -y

#lazy git
mkdir tmp && cd tmp
curl -LO https://github.com/jesseduffield/lazygit/releases/download/v0.38.2/lazygit_0.38.2_Linux_x86_64.tar.gz
tar xzf lazygit_0.38.2_Linux_x86_64.tar.gz
mv $PWD/lazygit $HOME/.local/bin/lazygit
cd ..
rm -rf tmp

#ergogen and qmk
git clone https://github.com/ergogen/ergogen ~/.local/share/ergogen
git clone https://github.com/qmk/qmk_firmware ~/.local/share/qmk_firmware
python3 -m pip install --user qmk

#configs
for d in $(ls $PWD/scripts);
do
  ln -s -f $PWD/scripts/$d $HOME/.local/bin/$d;
done

curl -L https://bit.ly/n-install | N_PREFIX=~/.local/share/n bash -s -- -y
export N_PREFIX="$HOME/.local/share/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

#final installs
cd ~/.local/share/ergogen
npm install
PATH=$PATH:$HOME/.local/bin
qmk setup -H ~/.local/share/qmk_firmware -y
ln -s -f ~/.local/share/ergogen/src/cli.js ~/.local/bin/ergogen
