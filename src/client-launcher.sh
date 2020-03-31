#!/bin/bash
#
# Script to launch Stremio web interface in kiosk mode
#
# Written by https://github.com/shivasiddharth

# Run this script in display 0 - the monitor
export DISPLAY=:0

# If Chromium crashes (usually due to rebooting), clear the crash flag so we don't have the annoying warning bar
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/'
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/'

# Run Chromium and open tabs
/usr/bin/chromium-browser --kiosk --window-position=0,0 https://app.strem.io &
