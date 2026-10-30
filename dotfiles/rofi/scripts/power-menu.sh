#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Power off"
    echo "Hibernate"
    echo "Suspend"
    echo "Lock screen"
    echo "Back"
else
    case "$1" in
        "Power off")
		shutdown now
		;;
        "Hibernate")
		systemctl hibernate
		;;
        "Suspend")
		systemctl suspend
		;;
	"Lock screen")
		hyprlock -q
		;;
    esac
fi
