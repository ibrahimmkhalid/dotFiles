cp ../../tools/ergogen/src/footprints/diode.js ../../tools/ergogen/src/footprints/diode.js.bak
cp ./diode.js ../../tools/ergogen/src/footprints/diode.js

cp ../../tools/ergogen/src/footprints/promicro.js ../../tools/ergogen/src/footprints/promicro.js.bak
cp ./promicro.js ../../tools/ergogen/src/footprints/promicro.js

cp ../../tools/ergogen/src/footprints/via.js ../../tools/ergogen/src/footprints/via.js.bak
cp ./via.js ../../tools/ergogen/src/footprints/via.js

../../tools/ergogen/src/cli.js ./input.yaml -o output

mv ../../tools/ergogen/src/footprints/diode.js.bak ../../tools/ergogen/src/footprints/diode.js
mv ../../tools/ergogen/src/footprints/promicro.js.bak ../../tools/ergogen/src/footprints/promicro.js
mv ../../tools/ergogen/src/footprints/via.js.bak ../../tools/ergogen/src/footprints/via.js
