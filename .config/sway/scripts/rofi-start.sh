#!/bin/bash
monitor=$(swaymsg -t get_outputs | jq '.[] | select(.focused) | .name' -r)

export GTK_ICON_THEME=BeautyLine-V3

rofi \
    -monitor "$monitor"\
    -show drun \
    -modi run,drun,ssh \
    -scroll-method 0 \
    -drun-match-fields all \
    -drun-display-format "{icon} {name}" \
    -no-drun-show-actions \
    -terminal kitty \
    -theme "$HOME"/.config/rofi/config/launcher.rasi

