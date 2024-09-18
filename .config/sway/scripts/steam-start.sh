#!/bin/bash
# Add shared script Functions
source "$HOME/.config/function_helper.sh"

SCRIPT="$HOME/.millennium/start.sh"

send_notification "normal" "Starting Steam" "Starting the Script to run Steam" "$HOME/.icons/BeautyLine-Garuda/apps/scalable/steam.svg"
nohup "$SCRIPT" &
