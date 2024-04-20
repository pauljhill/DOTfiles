#!/bin/bash

# Source directory where the original configuration files are located for restoration
SOURCE="$HOME/dotfiles"

# Destination directory where the restored files will go
DESTINATION="$HOME/.config"

# Function to restore configurations
restore_configs() {
    local src="$1"
    local dest="$2"

    # Check if the source directory for restoration exists
    if [ ! -d "$src" ]; then
        echo "Source directory does not exist. No files to restore."
        return 1
    fi

    # Restore files from the source to the destination directory
    for file in "$src"/*; do
        local filename=$(basename "$file")
        if [ -L "$dest/$filename" ]; then
            # Remove the symlink at the destination
            rm "$dest/$filename"
            echo "Removed symlink: $dest/$filename"
        elif [ -e "$dest/$filename" ]; then
            # If a real file or directory exists with the same name, skip or handle as needed
            echo "Skipping: $dest/$filename exists."
            continue
        fi
        # Copy files from source to the destination
        cp -a "$file" "$dest/"
        echo "Copied $file to $dest/"
    done

    # Handle subdirectories and files within them recursively
    for dir in "$src"/*/; do
        local dirname=$(basename "$dir")
        if [ -d "$dir" ]; then
            # Make sure the destination directory exists
            mkdir -p "$dest/$dirname"
            restore_configs "$dir" "$dest/$dirname"
        fi
    done
}

# Start the restoration process
restore_configs "$SOURCE" "$DESTINATION"

echo "All configurations have been restored from $SOURCE to $DESTINATION."
