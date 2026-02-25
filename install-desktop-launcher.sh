#!/bin/bash

# Get the original username, even if running with sudo
if [ "$SUDO_USER" ]; then
  CURRENT_USER=$SUDO_USER
else
  CURRENT_USER=$(whoami)
fi

INSTALL_DIR="/home/$CURRENT_USER/.local/share/applications"

# Create the applications directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Create the .desktop file directly (avoids line ending issues)
cat > "$INSTALL_DIR/stremio.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Stremio
Comment=Stremio Desktop Application
Exec=/home/$CURRENT_USER/stremio/node_modules/.bin/electron /home/$CURRENT_USER/stremio/main.js
Icon=/home/$CURRENT_USER/stremio/icon.png
Terminal=false
Categories=AudioVideo;Video;Player;
StartupNotify=true
EOF

# Make it executable
chmod +x "$INSTALL_DIR/stremio.desktop"

# Update desktop database (for some Linux distributions)
update-desktop-database "$INSTALL_DIR" 2>/dev/null || true

echo "Desktop launcher installed successfully!"
echo "Stremio should now appear in your application menu."
