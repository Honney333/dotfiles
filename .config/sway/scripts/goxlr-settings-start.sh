#!/bin/bash

# Source the functions file
source "$HOME/.config/function_helper.sh"

sleep 10
goxlr-client profiles device load 'Default'
send_normal_notification "GOXLR active" "GOXLR settings initiated"