#!/bin/bash

# Source the functions file
source "$HOME/.config/function_helper.sh"

SCRIPT="goxlr-client volume line-out 100"
SCRIPT2="goxlr-client volume headphones 0"

$SCRIPT
$SCRIPT2
send_normal_notification "Switched to Speaker" "Muted the Headphones and set the Speaker to a appropiate Volume."