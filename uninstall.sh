#!/bin/bash

# Get the original username, even if running with sudo
if [ "$SUDO_USER" ]; then
  CURRENT_USER=$SUDO_USER
else
  CURRENT_USER=$(whoami)
fi

echo "Uninstalling Stremio..."

# Stop and disable the systemd service
if systemctl is-active --quiet stremio.service; then
    echo "Stopping Stremio service..."
    sudo systemctl stop stremio.service
fi

if systemctl is-enabled --quiet stremio.service; then
    echo "Disabling Stremio service..."
    sudo systemctl disable stremio.service
fi

# Remove systemd service file
if [ -f /etc/systemd/system/stremio.service ]; then
    echo "Removing systemd service file..."
    sudo rm /etc/systemd/system/stremio.service
    sudo systemctl daemon-reload
fi

# Remove desktop launcher
if [ -f /home/$CURRENT_USER/.local/share/applications/stremio.desktop ]; then
    echo "Removing desktop launcher..."
    rm /home/$CURRENT_USER/.local/share/applications/stremio.desktop
    update-desktop-database /home/$CURRENT_USER/.local/share/applications 2>/dev/null || true
fi

echo "Uninstallation complete!"
