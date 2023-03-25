#!/bin/bash
#Set source and destination paths
SRC="./"
DEST="../dotFiles-public-tmp/"

# List of files and folders to exclude
EXCLUDE=(
    ".git"
    ".gitsubmodules"
    "./keyboard-configurations/tools/ergogen"
    "./keyboard-configurations/tools/qmk_firmware"
    "readme.md"
)

# Construct exclude list for find command
EXCLUDE_FIND=$(printf " -path %s -o" "${EXCLUDE[@]}" | sed 's/ -o$//')

# Copy all files and directories except for the specified ones
find "$SRC" -mindepth 1 \( $EXCLUDE_FIND \) -prune -o -exec cp -R '{}' "$DEST" \;
