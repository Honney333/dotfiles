#!/bin/bash

# Source the functions file
source "$HOME/.config/function_helper.sh"

SCRIPT="goxlr-client volume line-out 0"
SCRIPT2="goxlr-client volume headphones 60"

$SCRIPT
$SCRIPT2
send_normal_notification "Switched to Headphones" "Muted the Speaker and set the Headphones to a appropiate Volume."