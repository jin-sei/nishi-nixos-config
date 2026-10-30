#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Dwindle"
    echo "Master"
    echo "Scrolling"
    echo "Monocle"
    echo "Back"
else
    case "$1" in
        "Dwindle")
		hyprctl -q eval "hl.workspace_rule({ workspace = '$(hyprctl activeworkspace | grep -E '^workspace ID' | awk '{print $3}' | tr -d '()')', layout = 'dwindle' })"
		;;
        "Master")
		hyprctl -q eval "hl.workspace_rule({ workspace = '$(hyprctl activeworkspace | grep -E '^workspace ID' | awk '{print $3}' | tr -d '()')', layout = 'master' })"
		;;
        "Scrolling")
		hyprctl -q eval "hl.workspace_rule({ workspace = '$(hyprctl activeworkspace | grep -E '^workspace ID' | awk '{print $3}' | tr -d '()')', layout = 'scrolling' })"
		;;
	"Monocle")
		hyprctl -q eval "hl.workspace_rule({ workspace = '$(hyprctl activeworkspace | grep -E '^workspace ID' | awk '{print $3}' | tr -d '()')', layout = 'monocle' })"
		;;
    esac
fi
