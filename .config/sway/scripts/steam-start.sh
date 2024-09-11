#!/bin/bash
# Add shared script Functions
source "$HOME/.config/function_helper.sh"

SCRIPT="$HOME/.millennium/start.sh"

send_normal_notification "Starting Steam" "Starting the Script to run Steam"
nohup "$SCRIPT" &
