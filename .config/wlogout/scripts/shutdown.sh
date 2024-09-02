#!/bin/bash

# Source the functions file
source "$HOME/.config/function_helper.sh"

MOUNT_POINT_RAID="$HOME/Raid/"
MOUNT_POINT_SSD="$HOME/Server-SSD/"
SERVER_IP="192.168.0.1"

UNMOUNT_SCRIPT="$HOME/.config/fish/scripts/unmount.sh"
SHUTDOWN_SCRIPT="$HOME/.config/fish/scripts/shutdown-server.sh"
GOXLR_SCRIPT="$HOME/.config/wlogout/scripts/goxlr-sleep.sh"

if is_mounted "$MOUNT_POINT_RAID" || is_mounted "$MOUNT_POINT_SSD"; then
    UNMOUNT_SCRIPT
    wait 2
fi


if ping -c 1 -W 2 $SERVER_IP > /dev/null 2>&1; then
    SHUTDOWN_SCRIPT
fi

$GOXLR_SCRIPT

shutdown -h now