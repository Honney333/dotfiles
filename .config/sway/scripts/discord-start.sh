#!/bin/bash
# Add shared script Functions
source "$HOME/.config/function_helper.sh"

SCRIPT="/usr/bin/vesktop"

send_notification "normal" "Starting Discord" "Starting the Script to run Vesktop" "$HOME/.icons/BeautyLine-Garuda/apps/scalable/discord.svg"
nohup "$SCRIPT" &
