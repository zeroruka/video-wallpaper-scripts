#!/bin/sh

# Installs the script
# check if the script is already installed
if [ -f $HOME/.config/video-wallpapers/wallhelper ]; then
    echo "Wallhelper is already installed"
    exit 0
fi

# create the config directory
mkdir -p $HOME/.config/video-wallpapers
mv scripts/* $HOME/.config/video-wallpapers/
chmod +x $HOME/.config/video-wallpapers/wallhelper
chmod +x $HOME/.config/video-wallpapers/setwall

# prompt the user if they want to install example wallpapers
echo "Do you want to install example wallpapers? (y/n)"
read answer
if [ "$answer" = "y" ]; then
    mkdir -p $HOME/.config/video-wallpapers/wallpapers
    mv examples/* $HOME/.config/video-wallpapers/wallpapers
    echo "1" >$HOME/.config/video-wallpapers/wallpaperVar
fi

echo "Successfully installed!"
