
#!/bin/bash

# Source the functions file
source "$HOME/.config/function_helper.sh"

MOUNT_POINT_RAID="$HOME/Raid/"
MOUNT_POINT_SSD="$HOME/Server-SSD/"

UNMOUNT_SCRIPT="$HOME/.config/fish/scripts/unmount.sh"
GOXLR_SCRIPT="$HOME/.config/wlogout/scripts/goxlr-sleep.sh"

if is_mounted "$MOUNT_POINT_RAID" || is_mounted "$MOUNT_POINT_SSD"; then
    UNMOUNT_SCRIPT
    wait 2
fi

$GOXLR_SCRIPT

systemctl reboot