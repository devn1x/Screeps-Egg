#!/bin/bash
cd /home/container

echo "Image version: $EGG_VERSION ($EGG_BRANCH)"
if [ "$EGG_BRANCH" = "dev" ]; then
    echo "NOTICE: This image was built from the development branch and might be unstable."
fi

# Notify about a newer egg
installed=$(sed -n 's/^EGG_INSTALLED_VERSION=//p' init.sh 2>/dev/null)
if [ "$EGG_VERSION" != "unreleased" ] && [ "$installed" != "$EGG_VERSION" ]; then
    echo "NOTICE: Egg version ${installed:-unknown} found, but version $EGG_VERSION is available."
    echo "NOTICE: How to update: https://github.com/devn1x/Screeps-Egg#updating-and-resetting"
fi

# Run the Server
eval ${STARTUP} 