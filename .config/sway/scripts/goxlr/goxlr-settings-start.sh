#!/bin/bash

# Source the functions file
source "$HOME/.config/function_helper.sh"

sleep 10
goxlr-client profiles device load 'Default'
send_notification "normal" "GOXLR active" "GOXLR settings initiated" "$HOME/.icons/BeautyLine-Garuda/apps/scalable/goxlr-utility.svg"