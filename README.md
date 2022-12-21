# Video Wallpaper Scripts

Some scripts to make setting a video as your wallpaper on linux easier. This is only tested working on arch with tiling WMs.

##### Change wallpaper quickly using setwall script

![setwall_withkeybind](attachments/setwall_withkeybind.gif)

##### Fully in background

![background](attachments/fully_in_background.gif)

## Dependencies

- [xwinwrap-baitinq-git](https://aur.archlinux.org/packages/xwinwrap-baitinq-git/) (AUR)
- mplayer
- ffmpeg
- vlc (optional)
- Wallpaper Engine (optional but recommended)

## Installation

1. Clone the repository
2. Make install.sh executable if needed
3. Run install.sh

# Usage

## Wallhelper script

This script is meant to be used together with wallpaper engine to make things easier when settings a video as your wallpaper.

It is recommended to symlink this script to your path, so that you can run it from anywhere. (e.g. `ln -s /path/to/wallhelper ~/.local/bin/wallhelper`)

### With Wallpaper Engine

#### Previewing a wallpaper

1. Make sure the wallpaper you want to preview is already downloaded in your steam library
2. - Copy the url of the wallpaper you want to preview, and run the wallhelper script using the following command: `wallhelper -p`.
   - Alternatively, you can also specify the wallpaper id as an argument to the script: `wallhelper -p <wallpaper_id>`. The wallpaper id can be found in the url of any wallpapers you subscribed to.
   - ![Example](attachments/wallpaper_id.png)

3. The script will open mplayer/vlc to preview your wallpaper.

![previewing](attachments/previewing.gif)

#### Setting a wallpaper

1. Make sure wallpaper engine is downloaded and in your steam library
2. Go to wallpaper engine properties and enable 'Force the use of a specific Steam Play compatability tool' in the Compatability tab
3. Visit the [Wallpaper Engine Workshop](https://steamcommunity.com/workshop/browse/?appid=431960), login and browse for a video you want to use as your wallpaper. (**Note:** Filter by 'Video' format since this script does not support any other format such as scene or html)
4. Subscribe to a wallpaper you like and wait for it to finish downloading
5. - Copy the url of the wallpaper you just subscribed to, and run the wallhelper script using the following command: `wallhelper`.

   ![setting_wallpaper](attachments/setting_wallpaper.gif)

   - Alternatively, you can also specify the wallpaper id as an argument to the script: `wallhelper <wallpaper_id>`. The wallpaper id can be found in the url of any wallpapers you subscribed to.

   ![setting_wallpaper_with_id](attachments/setting_wallpaper_2.gif)

6. The script will now look for the wallpaper in your steam workshop folder and copy it to `~/.config/video-wallpapers/wallpapers/`. You can use setwall script to cycle through the wallpapers in this folder.

#### Optimizing a wallpaper

1. Run the wallhelper script using the following command: `wallhelper -o`.
2. This will optimize the last added wallpaper in `~/.config/video-wallpapers/wallpapers/` using ffmpeg.
3. The wallpaper will be changed to your screen resolution. This will make the wallpaper run smoother and use less resources.
4. It is recommended to optimize all wallpapers you want to use as your wallpaper.
5. You can further optimize the wallpapers yourself to remove more stuttering and improve performance.

##### Unoptimized (4k choppy video)

![unoptimized](attachments/unoptimized.gif)

##### Optimized (native resolution smoother video)

![optimized](attachments/optimized.gif)

#### Deleting a wallpaper

1. Run the wallhelper script using the following command: `wallhelper -d`.
2. This will delete the last added wallpaper in `~/.config/video-wallpapers/wallpapers/`.
3. Alternatively, you can use `wallhelper -d <wallpaper-number>` to delete a specific wallpaper. (**Note:** The wallpaper number is the number in the name of the wallpaper in `~/.config/video-wallpapers/wallpapers/`, it is not the same as wallpaper id)

![deleting](attachments/deleting.gif)

### Without Wallpaper Engine (Manual wallpaper adding)

The script can also be used without wallpaper engine. However, you will only be able to use the optimizing and deleting functions of the script. (Maybe i'll improve it in the future)

To add a wallpaper manually:

1. Download a video you want to use as your wallpaper
2. Move the video to `~/.config/video-wallpapers/wallpapers/`
3. Rename the video so that it is incremental (e.g. 1.mp4, 2.mp4, 3.mp4, etc.)

Deletion and optimization works the same as with wallpaper engine.

---

## Setwall script

This script is used to cycle through wallpapers in `~/.config/video-wallpapers/wallpapers/` and set them as your wallpaper.

It is recommended to use this script with a keybind. (e.g. Super+Alt+W)

![setwall_withoutkeybind](attachments/setwall.gif)

# Autostart

Add the following to your xprofile to autostart video wallpaper:

```sh
var=$(cat $HOME/.config/video-wallpapers/wallpaperVar)
newvar=$((var - 1))
screenRes=$(xrandr | grep '*' | awk '{print $1}')
if [ $newvar -eq 0 ]; then
    newvar=$(ls $HOME/.config/video-wallpapers/wallpapers | wc -l)
fi
xwinwrap -g $screenRes+0+0 -ov -un -s -ni -nf -debug -r -- mplayer -wid WID -quiet -nosound $HOME/.config/video-wallpapers/wallpapers/$newvar.mp4 -loop 0 -nolirc -nomouseinput & # set the background
```

---

#### RAM consumption

Base on my tests, mplayer only takes up less tha 300MB RAM. It should not cause significant slowdowns on your system.

#### Why not mpv?

Mpv made my system slow down much more than mplayer, therefore i decided to use mplayer instead. You could try using mpv and see if it works better for you.
