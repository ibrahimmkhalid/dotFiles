#!/bin/bash
set -e

ln -s -f $PWD/zshrc $HOME/.zshrc

rm $HOME/.config/tmux -rf
ln -s -f $PWD/tmux $HOME/.config/tmux

rm $HOME/.config/nvim -rf
ln -s -f $PWD/nvim $HOME/.config/nvim

for d in $(ls $PWD/scripts);
do
  ln -s -f $PWD/scripts/$d $HOME/.local/bin/$d;
done
