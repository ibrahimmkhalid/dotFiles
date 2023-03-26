#!/bin/bash

# Define the source and destination directories
src_dir="../dotFiles"
dest_dir="../dotFiles-public-tmp"

# Define the list of files and directories to exclude
exclude_list="./.git ./.gitmodules ./update-public-repo.sh ./keyboard-configurations/tools/ergogen ./keyboard-configurations/tools/qmk_firmware ./readme.md"

tmp_dir=$dest_dir.tmp
cp $src_dir $tmp_dir -rf


for item in $exclude_list; do
  if [ "${item:0:1}" = "." ]; then
    excluded_file_in_tmp_dir="$tmp_dir${item:1}"
  else
    excluded_file_in_tmp_dir="$tmp_dir/$item"
  fi
  rm -rf $excluded_file_in_tmp_dir
done

ls $tmp_dir -la
cp -rf $tmp_dir/* $dest_dir/
cp -rf $tmp_dir/.gitignore $dest_dir/


rm -rf $tmp_dir
