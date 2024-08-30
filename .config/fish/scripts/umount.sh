#!/bin/bash

# Source the functions file
source "$HOME/.config/function_helper.sh"

# Define mount points
MOUNT_POINT_RAID="$HOME/Raid/"
MOUNT_POINT_SSD="$HOME/Server-SSD/"

PASSWORD_FILE="$HOME/.cred/credentials.txt"
PASSWORD=$(<"$PASSWORD_FILE")

# Unmount RAID
if is_mounted "$MOUNT_POINT_RAID"; then
    if echo "$PASSWORD" | sudo -S umount "$MOUNT_POINT_RAID"; then
        send_low_notification "Unmount Successful" "Unmounted $MOUNT_POINT_RAID successfully."
    else
        send_high_notification "Unmount Failed" "Failed to unmount $MOUNT_POINT_RAID."
        exit 1
    fi
else
    send_low_notification "Not Mounted" "$MOUNT_POINT_RAID is not mounted."
fi

# Unmount SSD
if is_mounted "$MOUNT_POINT_SSD"; then
    if echo "$PASSWORD" | sudo -S umount "$MOUNT_POINT_SSD"; then
        send_low_notification "Unmount Successful" "Unmounted $MOUNT_POINT_SSD successfully."
    else
        send_high_notification "Unmount Failed" "Failed to unmount $MOUNT_POINT_SSD."
        exit 1
    fi
else
    send_low_notification "Not Mounted" "$MOUNT_POINT_SSD is not mounted."
fi