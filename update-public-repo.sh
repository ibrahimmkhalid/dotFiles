#!/bin/bash

# Define the source and destination directories
src_dir="./"
dest_dir="../dotFiles-public"

# Define the list of files and directories to exclude
exclude_list=".git .gitsubmodules update-public-repo.sh ./keyboard-configurations/tools/ergogen ./keyboard-configurations/tools/qmk_firmware readme.md"

# Copy the contents of the source directory to the destination directory, excluding the files and directories in the exclude list
cp -r --parents $(find $src_dir -type f | grep -vE "$(echo $exclude_list | sed 's/ /|/g')") $dest_dir
