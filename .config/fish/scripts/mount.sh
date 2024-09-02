#!/bin/bash

# Source the functions file
source "$HOME/.config/function_helper.sh"

# Configuration
SERVER_IP="192.168.0.1"
CRENDENTIALS="$HOME/.cred/.smbcred"
MOUNT_POINT_RAID="$HOME/Raid/"
MOUNT_POINT_SSD="$HOME/Server-SSD/"
PASSWORD_FILE="$HOME/.cred/credentials.txt"

# Read the password from the file
PASSWORD=$(<"$PASSWORD_FILE")

# Function to mount all shares
function mount_all() {
    if ping -c 1 -W 2 $SERVER_IP > /dev/null 2>&1; then
	send_low_notification "Ping Successful" "$SERVER_IP is Up and Running. Continuing to mount."
        # Mount RAID
        if ! is_mounted "$MOUNT_POINT_RAID"; then
            if echo "$PASSWORD" | sudo -S mount -t cifs -o credentials="$CRENDENTIALS",uid=1000,gid=1000 //$SERVER_IP/RAID "$MOUNT_POINT_RAID"; then
                send_low_notification "Mount Successful" "Mounted RAID at $MOUNT_POINT_RAID successfully."
            else
                send_high_notification "Mount Failed" "Failed to mount RAID at $MOUNT_POINT_RAID."
                exit 1
            fi
        else
            send_low_notification "Already Mounted" "RAID is already mounted at $MOUNT_POINT_RAID."
        fi

        # Mount SSD
        if ! is_mounted "$MOUNT_POINT_SSD"; then
            if echo "$PASSWORD" | sudo -S mount -t cifs -o credentials="$CRENDENTIALS",uid=1000,gid=1000 //$SERVER_IP/Server-SSD "$MOUNT_POINT_SSD"; then
                send_low_notification "Mount Successful" "Mounted SSD at $MOUNT_POINT_SSD successfully."
            else
                send_high_notification "Mount Failed" "Failed to mount SSD at $MOUNT_POINT_SSD."
                exit 1
            fi
        else
            send_low_notification "Already Mounted" "SSD is already mounted at $MOUNT_POINT_SSD."
        fi
    else
        send_normal_notification "Connection Failed" "Could not connect to IP: $SERVER_IP."
        exit 1
    fi
}

# Call the mount_all function
mount_all
