#!/bin/bash

# This script is sponsored by GCP (Google, Copy, Paste)
# https://unix.stackexchange.com/questions/289572/random-image-generator

WALLPAPER_DIR="/tmp/wallpaper/"
WALLPAPER_FILE=$WALLPAPER_DIR$(uuidgen)"_random.png"

rm -rf $WALLPAPER_DIR
mkdir $WALLPAPER_DIR

mx=16;my=16;head -c "$((3*mx*my))" /dev/urandom | convert -depth 8 -size "${mx}x${my}" RGB:- $WALLPAPER_FILE
if [ $XDG_CURRENT_DESKTOP = "LXQt" ]; then
	
    pcmanfm-qt --set-wallpaper=$WALLPAPER_FILE
else if [ $XDG_CURRENT_DESKTOP = "ubuntu:GNOME" ]; then
    gsettings set org.gnome.desktop.background picture-uri file:///$WALLPAPER_FILE
    else 
        echo $XDG_CURRENT_DESKTOP
        echo "You have no power here!"
    fi
fi
