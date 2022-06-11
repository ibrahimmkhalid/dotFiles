#!/bin/bash

echo "Installing basic applications"
sudo apt install make git wget curl tmux zsh ranger htop

echo "Cloning into submodules"
git clone https://github.com/ibrahimmkhalid/AstroNvim

git config --global user.name "Ibrahim Mansoor Khalid"
git config --global user.email "ibrahimmkhalid@gmail.com"

