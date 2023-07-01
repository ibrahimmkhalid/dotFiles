#!/bin/bash
QMK_HOME=~/.local/share/qmk_firmware
ln -s $PWD/fwk/ $QMK_HOME/keyboards/fwk

if [ -z "$1" ]; then
  km="default"
else
  km="$1"
fi

qmk compile -kb fwk -km "$km"
rm $QMK_HOME/keyboards/fwk
mv $QMK_HOME/fwk_"$km".hex $PWD/output.hex
rm -rf $QMK_HOME/.build
