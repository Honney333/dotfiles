#!/bin/bash
PASSWORD_FILE="$HOME/.cred/credentials_s.txt"
PASSWORD=$(<"$PASSWORD_FILE")
SERVERIP="192.168.0.1"
USERNAME="Honney"
COMMAND="shutdown /s /t 0"

sshpass\
	-p "$PASSWORD" ssh "$USERNAME"@"$SERVERIP" "$COMMAND"