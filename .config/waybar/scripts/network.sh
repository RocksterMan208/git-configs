#!/usr/bin/env bash

# Show a menu of available networks (no blanks, no duplicates)
ssid=$(nmcli -t -f SSID device wifi list |
    awk 'NF && !seen[$0]++' |
    wofi --dmenu --prompt "WiFi:")

# Nothing selected, so quit
if [ -z "$ssid" ]; then
    exit 0
fi

# Try connecting without a password (open or already saved networks)
if nmcli device wifi connect "$ssid" 2>/dev/null; then
    exit 0
fi

# That failed, so ask for the password
pass=$(wofi --dmenu --password --prompt "Password:" </dev/null)

if [ -n "$pass" ]; then
    nmcli device wifi connect "$ssid" password "$pass"
fi
