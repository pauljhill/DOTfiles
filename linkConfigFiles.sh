#!/bin/bash

# Source directory where the original config files are located
SOURCE="$HOME/~dot-files"

# Destination directory where symlinks will be created
DESTINATION="$HOME/.config"

# Backup directory for existing configurations
BACKUP_DIR="$DESTINATION/backups"

# Function to remove broken symlinks
remove_broken_symlinks() {
    local dest="$1"
    find "$dest" -type l ! -exec test -e {} \; -print | while read symlink; do
        echo "Removing broken symlink: $symlink"
        rm "$symlink"
    done
}

# Function to create symlinks recursively
link_recursive() {
    local src="$1"
    local dest="$2"
    
    mkdir -p "$dest" # Ensure the destination directory exists
    mkdir -p "$BACKUP_DIR" # Ensure the backup directory exists

    # Remove any broken symlinks in the destination directory
    remove_broken_symlinks "$dest"

    for file in "$src"/*; do
        local filename=$(basename "$file")
        if [ -e "$dest/$filename" ]; then
            # Move existing files/directories to the backup directory
            mv "$dest/$filename" "$BACKUP_DIR/"
            echo "Moved existing $dest/$filename to $BACKUP_DIR/"
        fi
        # Create a symlink from source to destination
        ln -snf "$file" "$dest/$filename"
        echo "Linked $file to $dest/$filename"
    done
}

# Start the linking process
link_recursive "$SOURCE" "$DESTINATION"

echo "All configurations have been linked and backed up as necessary."

