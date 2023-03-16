#!/bin/bash
cd ../../tools/qmk_firmware/keyboards
ln -s ../../../fwk_v1/qmk/fwk/ fwk

if [ -z "$1" ]; then
  km="default"
else
  km="$1"
fi

qmk compile -kb fwk -km "$km"
rm fwk
