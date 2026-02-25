# Stremio

Desktop application for Stremio server.

![github-small](https://github.com/shivasiddharth/Stremio-RaspberryPi/blob/Awesome/images/Banner.jpg)

## **If you like the work and if you would like to get me a :coffee: :smile:** [![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=7GH3YDCHZ36QN)  

## Contents

| File | Description |
|------|-------------|
| `main.js` | Electron main process |
| `package.json` | Node.js dependencies |
| `stremio_server_setup.sh` | Installs and builds Stremio server |
| `stremio-service-systemd-installer.sh` | Sets up auto-start on boot |
| `install-desktop-launcher.sh` | Installs the desktop launcher |
| `uninstall.sh` | Uninstaller |
| `icon.png` | Application icon |

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/shivasiddharth/Stremio-RaspberryPi.git
cd Stremio-RaspberryPi
```

### 2. Install Node.js and npm

If Node.js and npm are not installed, install them first:

```bash
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
```

### 3. Set up Stremio Server

```bash
bash stremio_server_setup.sh
```

This will:
- Detect your architecture (ARM64/ARM32/x86_64)
- Install required packages
- Install Rust (press Enter when prompted)
- Clone and build the Stremio server
- Generate SSL certificates
- Copy application files
- Install Electron dependencies

### 4. Set up Auto-start on Boot

```bash
sudo bash stremio-service-systemd-installer.sh
```

This requires sudo as it installs a systemd service.

### 5. Install Desktop Launcher

```bash
bash install-desktop-launcher.sh
```

### 6. Reboot

```bash
sudo reboot
```

## Running

After reboot:
- The server starts automatically
- Launch "Stremio" from your application menu (Pi menu)

Or manually:
```bash
cd ~/stremio && npm start
```

## Accessing from Other Devices

To access the Stremio server from other devices on your network, use:

```
https://<IP_ADDRESS_OF_PI>:12470
```

**Important:** The SSL certificates are self-generated. When accessing from other devices, you will need to accept the security warning in your browser. This is normal behavior for self-signed certificates.

## Notes

- Server runs on `https://localhost:11470`
- For remote access from other devices, use `https://<device-ip>:12470`
- The SSL certificate is self-signed - accept the security warning in your browser

## Uninstallation

To uninstall Stremio:

```bash
bash uninstall.sh
```

This will:
- Stop and disable the systemd service
- Remove the systemd service file
- Remove the desktop launcher
