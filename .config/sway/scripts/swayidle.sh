#!/bin/bash

lock_command="$1"

while true; do
    # Check if audio is playing
    if pactl list sinks | grep -q RUNNING; then
        swayidle \
            timeout 300 "exec $lock_command" \
            timeout 600 'swaymsg "output * dpms off"' \
            resume 'swaymsg "output * dpms on"' \
            before-sleep "exec $lock_command" &
    else
        swaymsg "output * dpms on"
        pkill swayidle
    fi
    sleep 10
done
