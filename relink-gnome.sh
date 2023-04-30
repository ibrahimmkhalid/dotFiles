#!/bin/bash
set -e

rm $HOME/.local/share/my-assets -rf
ln -s -f $PWD/my-assets $HOME/.local/share/my-assets

sed "s|HOME_DIR|$HOME|g" guillotine.json.tmp > guillotine.json
ln -s -f $PWD/guillotine.json $HOME/.config/guillotine.json

ln -s -f $PWD/alacritty.yml $HOME/.config/alacritty/alacritty.yml
