#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Undertow"
    echo "Net of Beings"
    echo "Rearview"
    echo "Honda"
    echo "Back"
else
    case "$1" in
        "Undertow")
		hyprctl hyprpaper wallpaper ",/home/jinsei/nishi-nixos-config/wallpapers/grey-undertow.jpeg"	
		;;
        "Net of Beings")
		hyprctl hyprpaper wallpaper ",/home/jinsei/nishi-nixos-config/wallpapers/grey-net-of-beings.png"
		;;
	"Rearview")
		hyprctl hyprpaper wallpaper ",/home/jinsei/nishi-nixos-config/wallpapers/rearview-mirror.jpg"	
		;;
        "Honda")
		hyprctl hyprpaper wallpaper ",/home/jinsei/nishi-nixos-config/wallpapers/honda.png"
		;;
    esac
fi
