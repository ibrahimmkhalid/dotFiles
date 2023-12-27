#!/bin/bash
set -e

#install
sudo add-apt-repository universe -y
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt update
sudo apt install make gawk wget curl ranger htop libfuse2 ripgrep gcc g++ unzip neofetch tldr lldb entr fzf xsel xclip python3 python-is-python3 python3-pip build-essential python3-venv ansible -y

#ergogen and qmk
git clone https://github.com/ergogen/ergogen ~/.local/share/ergogen
git clone https://github.com/qmk/qmk_firmware ~/.local/share/qmk_firmware
python3 -m pip install --user qmk

curl -L https://bit.ly/n-install | N_PREFIX=~/.local/share/n bash -s -- -y
export N_PREFIX="$HOME/.local/share/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

#final installs
cd ~/.local/share/ergogen
npm install
PATH=$PATH:$HOME/.local/bin
qmk setup -H ~/.local/share/qmk_firmware -y
ln -s -f ~/.local/share/ergogen/src/cli.js ~/.local/bin/ergogen
