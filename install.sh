#!/bin/sh
echo "OS Detecting..."
if [ "$(uname -s)" = Darwin ]; then
    echo "Installing for MacOS..."
    ./mac-install.sh
fi

echo "\nInstall successfully"
