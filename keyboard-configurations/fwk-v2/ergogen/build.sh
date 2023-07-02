#!/bin/bash

ERGOGEN_HOME=~/.local/share/ergogen/src
cp $ERGOGEN_HOME/footprints/diode.js $ERGOGEN_HOME/footprints/diode.js.bak
cp ./diode.js $ERGOGEN_HOME/footprints/diode.js

cp $ERGOGEN_HOME/footprints/promicro.js $ERGOGEN_HOME/footprints/promicro.js.bak
cp ./promicro.js $ERGOGEN_HOME/footprints/promicro.js

cp $ERGOGEN_HOME/footprints/via.js $ERGOGEN_HOME/footprints/via.js.bak
cp ./via.js $ERGOGEN_HOME/footprints/via.js

ergogen ./input.yaml -o output

mv $ERGOGEN_HOME/footprints/diode.js.bak $ERGOGEN_HOME/footprints/diode.js
mv $ERGOGEN_HOME/footprints/promicro.js.bak $ERGOGEN_HOME/footprints/promicro.js
mv $ERGOGEN_HOME/footprints/via.js.bak $ERGOGEN_HOME/footprints/via.js
