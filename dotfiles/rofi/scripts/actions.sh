#!/usr/bin/env bash

SCRIPT_DIR="$HOME/.config/rofi/scripts"

# options of the top level actions shown in the actions menu
if [ -z "$1" ] || [ "$1" == "Back" ]; then
    echo "Layout"
    echo "Wallpaper"
    echo "Power"
    echo "Cowsay"
else
    case "$1" in
	# actions triggered after selecting an action
        "Layout") "$SCRIPT_DIR/layout-menu.sh" ;;
        "Wallpaper") "$SCRIPT_DIR/wallpaper-menu.sh" ;;
        "Power") "$SCRIPT_DIR/power-menu.sh" ;;
	"Cowsay") notify-send "Daily Fortune" "$(fortune)" ;;

	# routing answers to subscripts
	"Dwindle"|"Master"|"Scrolling"|"Monocle")
            "$SCRIPT_DIR/layout-menu.sh" "$1" 
            ;;
	
	"Power off"|"Hibernate"|"Suspend"|"Lock screen")
            "$SCRIPT_DIR/power-menu.sh" "$1" 
            ;;
	
    	"Undertow"|"Net of Beings")
            "$SCRIPT_DIR/wallpaper-menu.sh" "$1" 
            ;;

    esac
fi
