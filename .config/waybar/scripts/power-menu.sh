#!/bin/bash

choice=$(echo -e "Suspend\nHibernate\nPower Off" | rofi -dmenu -p "Power Menu:")

case "$choice" in
  "Suspend")
    systemctl suspend
    ;;
  "Hibernate")
    systemctl hibernate
    ;;
  "Power Off")
    systemctl poweroff
    ;;
esac
