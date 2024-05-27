#!/bin/bash
source config.sh


# Check if the folder exists
if [ ! -d "$PAULS_BG_FOLDER" ]; then
    echo "Error: Image folder not found!"
    exit 1
fi

# Get a random image file from the folder
RANDOM_IMAGE=$(ls "$PAULS_BG_FOLDER" | shuf -n 1)

# Set the random image as the wallpaper using swww
#export SWWW_DURATION=1
swww img "$PAULS_BG_FOLDER/$RANDOM_IMAGE" 
wal -i $PAULS_BG_FOLDER/$RANDOM_IMAGE 
#wpg -a $PAULS_BG_FOLDER/$RANDOM_IMAGE 

