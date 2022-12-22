#!/bin/sh

# check if the script is already installed
if [ -f $HOME/.config/video-wallpapers/wallhelper ]; then
    echo "Wallhelper is already installed"
    echo "Update/reinstall wallhelper? (y/N)"
    read answer
    if [ "$answer" = "y" ]; then
        echo "Updating..."
        mv $HOME/.config/video-wallpapers/wallpapers $HOME/.config/
        rm -rf $HOME/.config/video-wallpapers
        mkdir -p $HOME/.config/video-wallpapers
        mv $HOME/.config/wallpapers $HOME/.config/video-wallpapers
        touch $HOME/.config/video-wallpapers/config.ini
        cp scripts/* $HOME/.config/video-wallpapers/
        echo "1" >$HOME/.config/video-wallpapers/wallpaperVar
        echo "Successfully updated!"
    fi
    exit 0
fi

# create the config directory
mkdir -p $HOME/.config/video-wallpapers
cp scripts/* $HOME/.config/video-wallpapers/
echo "1" >$HOME/.config/video-wallpapers/wallpaperVar

# prompt the user if they want to install example wallpapers
echo "Do you want to install example wallpapers? (y/N)"
read answer
if [ "$answer" = "y" ]; then
    mkdir -p $HOME/.config/video-wallpapers/wallpapers
    cp examples/* $HOME/.config/video-wallpapers/wallpapers
    echo "1" >$HOME/.config/video-wallpapers/wallpaperVar
fi

echo "Successfully installed!"
