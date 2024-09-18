#!/bin/bash

# Add shared script Functions
source "$HOME/.config/function_helper.sh"

send_notification "low" "Mute/Unmute Discord" "Starting the Script to mute/unmute Vesktop" "$HOME/.icons/BeautyLine-Garuda/apps/scalable/discord.svg"

# Focus the Vencord window using the class or instance
swaymsg '[class="vesktop"] focus'

# Send the mute/unmute shortcut (Ctrl + Shift + M)
wtype -M ctrl -M shift -k m -M ctrl -M shift
