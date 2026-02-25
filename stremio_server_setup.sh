#!/bin/bash

scripts_dir="$(dirname "${BASH_SOURCE[0]}")"

RUN_AS="$(ls -ld "$scripts_dir" | awk 'NR==1 {print $3}')"

if [ "$USER" != "$RUN_AS" ]
then
    echo "This script must run as $RUN_AS, trying to change user..."
    exec sudo -u $RUN_AS $0
fi


# Detect architecture
ARCH=$(uname -m)

echo "Detected Architecture: $ARCH"

# If ARM64 or ARMv8, set target for ARM64
if [ "$ARCH" == "aarch64" ]; then
    TARGET="aarch64-unknown-linux-gnu"
    echo "Compiling for ARM64 or ARMv8..."

# If ARM32 (armv7l), set target for ARM32
elif [ "$ARCH" == "armv7l" ]; then
    TARGET="armv7-unknown-linux-gnueabihf"
    echo "Compiling for ARM32 (armv7)..."

# If x86_64, set target for x86_64
elif [ "$ARCH" == "x86_64" ]; then
    TARGET="x86_64-unknown-linux-gnu"
    echo "Compiling for x86_64..."

# Add other architectures as needed
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

sudo apt-get update
sudo apt-get install git libssl-dev libglib2.0-dev libgtk-3-dev nodejs
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source /home/${USER}/.cargo/env
git clone https://github.com/shivasiddharth/stremio-service.git
cd stremio-service
rustup target add $TARGET
cargo build --target $TARGET --release

# Check if build succeeded
if [ $? -ne 0 ]; then
    echo "Build failed! Please fix the errors above before proceeding."
    exit 1
fi

# Output location
echo "Build complete. Check the binary in target/$TARGET/release/"

echo "Generating certificates..."
cd /home/${USER}/stremio-service/resources/certificates
openssl genpkey -algorithm RSA -out stremio.key -pkeyopt rsa_keygen_bits:2048
openssl req -new -key stremio.key -out stremio.csr
openssl x509 -req -days 9999 -in stremio.csr -signkey stremio.key -out stremio.cert

# Define the file to be edited
file="/home/${USER}/stremio-service/resources/bin/linux/server.js"

# Replace the line with the desired block of code
sed -i "/var sserver = https.createServer(app);/c\
try {\n\
          var fs = require(\"fs\");\n\
          var https = require(\"https\");\n\
          _cr = {\n\
            key: fs.readFileSync(\"/home/${USER}/stremio-service/resources/certificates/stremio.key\", \"utf8\"),\n\
            cert: fs.readFileSync(\"/home/${USER}/stremio-service/resources/certificates/stremio.cert\", \"utf8\")\n\
          };\n\
        } catch (e) {\n\
          console.error(\"Failed to load SSL cert:\", e);\n\
          _cr = { };\n\
        }\n\
        var sserver = https.createServer(_cr, app);" "$file"

echo "Replacement complete in $file."
echo "Installation complete. Please Reboot."
