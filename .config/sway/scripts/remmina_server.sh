#!/bin/bash
PASSWORD_FILE="$HOME/.cred/credentials_s.txt"
PASSWORD=$(<"$PASSWORD_FILE")
PROTOCOL="vnc"
SERVERIP="192.168.1.22"
USERNAME="Honney"
remmina\
     -c "$PROTOCOL://$USERNAME:$PASSWORD@$SERVERIP"
