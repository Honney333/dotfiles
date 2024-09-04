#!/bin/bash
# Add shared script Functions
source "$HOME/.config/function_helper.sh"

SCRIPT="/usr/bin/vesktop"

send_normal_notification "Starting Discord" "Starting the Script to run Vesktop"
nohup "$SCRIPT" &
