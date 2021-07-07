#!/bin/bash
#
# Script to launch Stremio web interface in kiosk mode
#
# Written by https://github.com/shivasiddharth


# Run Chromium and open tabs
/usr/bin/chromium-browser --app=https://app.strem.io/shell-v4.4/ --window-position=0,0 --start-fullscreen --use-gl=angle
