#!/bin/bash

# Function to create symlinks from ~/dotfiles to ~/.config
create_symlinks() {
    mkdir -p ~/.config/backup
    for item in ~/dotfiles/*; do
        base_item=$(basename "$item")
        if [ -e ~/.config/"$base_item" ]; then
            echo "Backing up existing item: $base_item"
            mv ~/.config/"$base_item" ~/.config/backup/
        fi
        echo "Creating symlink for $base_item"
        ln -s "$item" ~/.config/"$base_item"
    done
}

# Function to restore items from backup
restore_from_backup() {
    for item in ~/.config/backup/*; do
        base_item=$(basename "$item")
        if [ -L ~/.config/"$base_item" ]; then
            echo "Removing symlink: $base_item"
            rm ~/.config/"$base_item"
        fi
        echo "Restoring $base_item from backup"
        mv "$item" ~/.config/
    done
}

# Function to restore items from dotfiles
restore_from_dotfiles() {
    for item in ~/dotfiles/*; do
        base_item=$(basename "$item")
        if [ -L ~/.config/"$base_item" ]; then
            echo "Removing symlink: $base_item"
            rm ~/.config/"$base_item"
        fi
        echo "Copying $base_item from dotfiles"
        cp -r "$item" ~/.config/
    done
}

# Main script interaction
echo "Do you want to install or uninstall? (install/uninstall)"
read action

case $action in
    "install")
        create_symlinks
        ;;
    "uninstall")
        echo "Choose restore option: from 'backup' or 'dotfiles'?"
        read restore_option
        if [ "$restore_option" == "backup" ]; then
            restore_from_backup
        elif [ "$restore_option" == "dotfiles" ]; then
            restore_from_dotfiles
        else
            echo "Invalid option. Exiting."
            exit 1
        fi
        ;;
    *)
        echo "Invalid action. Exiting."
        exit 1
        ;;
esac

echo "Operation completed successfully."
