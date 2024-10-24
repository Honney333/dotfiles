#!/bin/bash
SCRIPT="kitty /usr/bin/onedrive --skip-size 10240 --monitor --verbose --sync-root-files"
nohup --no-startup-id "$SCRIPT" &
