#!/bin/bash

# Source the functions file
source "$HOME/.config/function_helper.sh"

SCRIPT="goxlr-daemon"
SCRIPT2="$HOME/.config/sway/scripts/goxlr/goxlr-settings-start.sh"

nohup "$SCRIPT" &
send_normal_notification "GOXLR daemon Started" "Launched the GOXLR Daemon to control the Audio"