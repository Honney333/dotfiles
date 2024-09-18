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
        send_notification "low" "Unmount Successful" "Unmounted $MOUNT_POINT_RAID successfully." "$HOME/.icons/BeautyLine-Garuda/devices/scalable/drive-harddisk-encrypted-symbolic.svg"
    else
        send_notification "high" "Unmount Failed" "Failed to unmount $MOUNT_POINT_RAID." "$HOME/.icons/BeautyLine-Garuda/devices/scalable/drive-harddisk-symbolic.svg"
        exit 1
    fi
else
    send_notification "low" "Not Mounted" "$MOUNT_POINT_RAID is not mounted." "$HOME/.icons/BeautyLine-Garuda/devices/scalable/drive-harddisk.svg"
fi

# Unmount SSD
if is_mounted "$MOUNT_POINT_SSD"; then
    if echo "$PASSWORD" | sudo -S umount "$MOUNT_POINT_SSD"; then
        send_notification "low" "Unmount Successful" "Unmounted $MOUNT_POINT_SSD successfully." "$HOME/.icons/BeautyLine-Garuda/devices/scalable/drive-harddisk-encrypted-symbolic.svg"
    else
        send_notification "high" "Unmount Failed" "Failed to unmount $MOUNT_POINT_SSD." "$HOME/.icons/BeautyLine-Garuda/devices/scalable/drive-harddisk-symbolic.svg"
        exit 1
    fi
else
    send_notification "low" "Not Mounted" "$MOUNT_POINT_SSD is not mounted." "$HOME/.icons/BeautyLine-Garuda/devices/scalable/drive-harddisk.svg"
fi