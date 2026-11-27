#!/usr/bin/env bash

entries="Lock\nSuspend\nShutdown\nReboot"

power=$(echo -e "$entries" | wofi --dmenu --prompt "Power Options:" || pkill wofi)

case "$power" in 
	Lock) hyprlock ;;
	Suspend) systemctl suspend ;;
	Shutdown) shutdown now ;;
	Reboot) reboot ;;
esac
