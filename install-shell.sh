#!/bin/bash
set -e

#install
sudo add-apt-repository universe -y
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt update
sudo apt install make gawk wget curl ranger htop libfuse2 ripgrep gcc g++ unzip neofetch tldr lldb entr fzf xsel xclip python3 python-is-python3 python3-pip build-essential python3-venv ansible -y

# qmk
git clone https://github.com/qmk/qmk_firmware ~/.local/share/qmk_firmware
python3 -m pip install --user qmk

PATH=$PATH:$HOME/.local/bin
qmk setup -H ~/.local/share/qmk_firmware -y
