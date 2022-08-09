#!/bin/bash
set -e

ln -s -f $PWD/zshrc $HOME/.zshrc
ln -s -f $PWD/tmux.conf $HOME/.tmux.conf
ln -s -f $PWD/tmux.conf.local $HOME/.tmux.conf.local
rm $HOME/.config/nvim -rf
ln -s -f $PWD/nvim $HOME/.config/nvim
for d in $(ls $PWD/scripts);
do
  ln -s -f $PWD/scripts/$d $HOME/.local/bin/$d;
done
rm $HOME/.local/share/my-assets -rf
ln -s -f $PWD/my-assets $HOME/.local/share/my-assets

if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null ; then
  echo "done"
else
  ln -s -f $PWD/guillotine.json $HOME/.config/guillotine.json
  ln -s -f $PWD/alacritty.yml $HOME/.config/alacritty/alacritty.yml
fi
