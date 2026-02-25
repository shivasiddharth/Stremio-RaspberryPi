#!/bin/bash

# Get the original username, even if running with sudo
if [ "$SUDO_USER" ]; then
  CURRENT_USER=$SUDO_USER
else
  CURRENT_USER=$(whoami)
fi

DESKTOP_FILE="/home/$CURRENT_USER/stremio/stremio.desktop"
INSTALL_DIR="/home/$CURRENT_USER/.local/share/applications"

# Create the applications directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Copy the .desktop file to the applications directory
cp "$DESKTOP_FILE" "$INSTALL_DIR/"

# Fix line endings (remove CRLF)
sed -i 's/\r$//' "$INSTALL_DIR/stremio.desktop"

# Make it executable
chmod +x "$INSTALL_DIR/stremio.desktop"

# Update desktop database (for some Linux distributions)
update-desktop-database "$INSTALL_DIR" 2>/dev/null || true

echo "Desktop launcher installed successfully!"
echo "Stremio should now appear in your application menu."
