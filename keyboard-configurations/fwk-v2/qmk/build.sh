#!/bin/bash
cd ../../tools/qmk_firmware/keyboards
ln -s ../../../fwk-v2/qmk/fwk/ fwk

if [ -z "$1" ]; then
  km="default"
else
  km="$1"
fi

qmk compile -kb fwk -km "$km"
rm fwk
cd ..
mv fwk_"$km".hex ../../fwk-v2/qmk/output.hex
rm -rf .build