#!/bin/sh

# check if the script is already installed
if [ -f $HOME/.config/video-wallpapers/wallhelper ]; then
    echo "Wallhelper is already installed"
    echo "Update/reinstall wallhelper? (y/N)"
    read answer
    if [ "$answer" = "y" ]; then
        echo "Updating..."
        rm -rf $HOME/.config/video-wallpapers
        mkdir -p $HOME/.config/video-wallpapers
        mkdir -p $HOME/.config/video-wallpapers/wallpapers
        touch $HOME/.config/video-wallpapers/config.ini
        cp scripts/* $HOME/.config/video-wallpapers/
        chmod +x $HOME/.config/video-wallpapers/wallhelper
        chmod +x $HOME/.config/video-wallpapers/setwall
        echo "Successfully updated!"
    fi
    exit 0
fi

# create the config directory
mkdir -p $HOME/.config/video-wallpapers
cp scripts/* $HOME/.config/video-wallpapers/
chmod +x $HOME/.config/video-wallpapers/wallhelper
chmod +x $HOME/.config/video-wallpapers/setwall

# prompt the user if they want to install example wallpapers
echo "Do you want to install example wallpapers? (y/N)"
read answer
if [ "$answer" = "y" ]; then
    mkdir -p $HOME/.config/video-wallpapers/wallpapers
    cp examples/* $HOME/.config/video-wallpapers/wallpapers
    echo "1" >$HOME/.config/video-wallpapers/wallpaperVar
fi

echo "Successfully installed!"
