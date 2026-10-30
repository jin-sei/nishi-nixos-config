#!/usr/bin/env bash

# When Rofi calls the script with NO arguments, return the menu items
if [ -z "$1" ]; then
    echo "First Option"
    echo "Second Option"
    echo "Third Option"
else
    # When the user selects an option, $1 contains the chosen text
    case "$1" in
        "First Option") notify-send "Selected 1" ;;
        "Second Option") notify-send "Selected 2" ;;
        "Third Option") notify-send "Selected 3" ;;
    esac
fi
