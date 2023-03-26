#!/bin/bash

src_dir="../dotFiles"
dest_dir="../dotFiles-public-tmp"

exclude_list="./exclude.txt"
echo './.git' >> $exclude_list
echo './.gitmodules' >> $exclude_list
echo './update-public-repo.sh' >> $exclude_list
echo './keyboard-configurations/tools/ergogen' >> $exclude_list
echo './keyboard-configurations/tools/qmk_firmware' >> $exclude_list
echo './readme.md' >> $exclude_list

echo '!./**/.git' >> $exclude_list
echo '!./**/.gitmodules' >> $exclude_list
echo '!./**/update-public-repo.sh' >> $exclude_list
echo '!./**/keyboard-configurations/tools/ergogen' >> $exclude_list
echo '!./**/keyboard-configurations/tools/qmk_firmware' >> $exclude_list
echo '!./**/readme.md' >> $exclude_list

rsync -av --delete --exclude-from=$exclude_list $src_dir/ $dest_dir/
rm $exclude_list
