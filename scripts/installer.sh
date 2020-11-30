#!/bin/bash
#
# Script for running Stremio on Raspberry Pi boards
#
# Written by https://github.com/shivasiddharth

echo "Get your popcorn while we prep your Pi......"
echo ""
set -o errexit

scripts_dir="$(dirname "${BASH_SOURCE[0]}")"
GIT_DIR="$(realpath $(dirname ${BASH_SOURCE[0]})/..)"

# make sure we're running as the owner of the checkout directory
RUN_AS="$(ls -ld "$scripts_dir" | awk 'NR==1 {print $3}')"
if [ "$USER" != "$RUN_AS" ]
then
    echo "This script must run as $RUN_AS, trying to change user..."
    exec sudo -u $RUN_AS $0
fi

echo "Updating the OS......."
echo ""
sudo apt-get update -y
echo ""
echo "Installing required packages........"
echo ""
sed 's/#.*//' ${GIT_DIR}/Requirements.txt | xargs sudo apt-get install -y
echo ""
echo "Finished installing the packages........"
echo ""
echo "Changing username in the service files........"
echo ""
sed -i 's/__USER__/'${USER}'/g' ${GIT_DIR}/systemd/stremio-client.service
sed -i 's/__USER__/'${USER}'/g' ${GIT_DIR}/systemd/stremio-server.service
echo ""
echo "Creating desktop shortcuts for starting client ............."
echo ""
sudo chmod +x ${GIT_DIR}/scripts/Stremio-Client-Service-Shortcut.sh
sudo chmod +x ${GIT_DIR}/src/client-launcher.sh
sudo \cp ${GIT_DIR}/scripts/Stremio-Client-Service-Shortcut.sh /home/${USER}/Desktop/Stremio-Client-Service-Shortcut.sh
sudo \cp ${GIT_DIR}/src/client-launcher.sh /home/${USER}/Dekstop/Stremio-Client-Launcher-Shortcut.sh
echo ""
echo "Finished installing. Sit back and enjoy the show............."
