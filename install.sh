#!/bin/bash

echo "---------------------"
echo "Installing basic applications"
sudo apt install make git wget curl tmux zsh ranger htop

echo "---------------------"
echo "Cloning into submodules"
git submodule update --init

echo "---------------------"
echo "git configs"
git config --global user.name "Ibrahim Mansoor Khalid"
git config --global user.email "ibrahimmkhalid@gmail.com"
git config --global core.editor nvim
echo "done"
