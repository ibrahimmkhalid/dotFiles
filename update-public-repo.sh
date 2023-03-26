#!/bin/bash

src_dir="../dotFiles"
dest_dir="../dotFiles-public"
tmp_dir="../dotFiles-tmp"

cp -rf $src_dir $tmp_dir
cd $tmp_dir
rm './.git' -rf
rm './.gitmodules' -rf
rm './update-public-repo.sh' -rf
rm './keyboard-configurations/tools/ergogen' -rf
rm './keyboard-configurations/tools/qmk_firmware' -rf
rm './readme.md' -rf

cd $dest_dir

mv './.git' $tmp_dir
mv './.gitmodules' $tmp_dir
mv './keyboard-configurations/tools/ergogen' $tmp_dir/keyboard-configurations/tools/ergogen
mv './keyboard-configurations/tools/qmk_firmware' $tmp_dir/keyboard-configurations/tools/qmk_firmware
mv './readme.md' $tmp_dir/readme.md

cd $src_dir
rm -rf $dest_dir
mv $tmp_dir $dest_dir
