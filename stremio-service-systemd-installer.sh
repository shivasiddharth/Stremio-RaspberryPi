#!/bin/bash


# Define variables
SERVICE_NAME="stremio.service"
SERVICE_PATH="/etc/systemd/system/$SERVICE_NAME"
NODE_PATH=$(which node)
# Get the original username, even if running with sudo
if [ "$SUDO_USER" ]; then
  CURRENT_USER=$SUDO_USER
else
  CURRENT_USER=$(whoami)
fi
WORKING_DIRECTORY="/home/$CURRENT_USER/stremio/stremio-service"
EXEC_PATH="$NODE_PATH $WORKING_DIRECTORY/resources/bin/linux/server.js"

# Check if Node.js is installed
if [ -z "$NODE_PATH" ]; then
  echo "Error: Node.js is not installed. Please install Node.js and try again."
  exit 1
fi

# Create the systemd service file
echo "Creating systemd service file at $SERVICE_PATH..."
sudo bash -c "cat > $SERVICE_PATH" <<EOL
[Unit]
Description=Stremio Service
After=network.target

[Service]
ExecStart=/usr/bin/sudo $EXEC_PATH
WorkingDirectory=$WORKING_DIRECTORY
Restart=always
User=$CURRENT_USER
Group=$CURRENT_USER
Environment=NODE_ENV=production

[Install]
WantedBy=multi-user.target
EOL

# Reload systemd, enable, and start the service
echo "Reloading systemd..."
sudo systemctl daemon-reload

echo "Enabling $SERVICE_NAME to start on boot..."
sudo systemctl enable $SERVICE_NAME

echo "Starting $SERVICE_NAME..."
sudo systemctl start $SERVICE_NAME

# Check service status
echo "Checking the status of $SERVICE_NAME..."
sudo systemctl status $SERVICE_NAME --no-pager

echo "Setup complete! The Stremio service is now running and will start on boot."
