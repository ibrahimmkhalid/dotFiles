#!/bin/bash
set -e

sed "s|HOME_DIR|$HOME|g" guillotine.json.tmp > guillotine.json
ln -s -f $PWD/guillotine.json $HOME/.config/guillotine.json
