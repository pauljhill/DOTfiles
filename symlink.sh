#!/bin/bash

# Directory configuration
SOURCE_DIR=~/dotfiles/config
TARGET_DIR=~/.config

# Ensure the target directory exists
mkdir -p "$TARGET_DIR"

# Create symlinks from source directory to target directory
for item in "$SOURCE_DIR"/*; do
    base_item=$(basename "$item")
    target_path="$TARGET_DIR/$base_item"

    # Remove the existing item if it's a symlink or a directory/file
    if [ -L "$target_path" ] || [ -e "$target_path" ]; then
        rm -rf "$target_path"  # Caution: this removes directories and files
    fi

    # Create symlink
    ln -s "$item" "$target_path"
done

echo "Symlinks created successfully."
sleep 2 
exit
