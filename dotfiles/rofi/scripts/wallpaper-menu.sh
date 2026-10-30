#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Undertow"
    echo "Net of Beings"
    echo "Back"
else
    case "$1" in
        "Undertow")
		hyprctl hyprpaper wallpaper ",/home/jinsei/nishi-nixos-config/wallpapers/grey-undertow.jpeg"	
		;;
        "Net of Beings")
		hyprctl hyprpaper wallpaper ",/home/jinsei/nishi-nixos-config/wallpapers/grey-net-of-beings.png"
		;;
    esac
fi
