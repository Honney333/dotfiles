#!/bin/bash
# Add shared script Functions
source "$HOME/.config/function_helper.sh"

send_normal_notification "Starting Steam" "Starting the Script to run Steam"

SCRIPT="/usr/bin/steam"
nohup "$SCRIPT" &
