#!/bin/bash
cd /home/container

echo "Screeps-Egg image version: $EGG_VERSION (branch: $EGG_BRANCH)"
if [ "$EGG_BRANCH" = "dev" ]; then
    echo "NOTICE: This image was built from the development branch."
fi

# Notify about a newer egg
installed=$(sed -n 's/^EGG_INSTALLED_VERSION=//p' init.sh 2>/dev/null)
if [ "$EGG_VERSION" != "unreleased" ] && [ "$installed" != "$EGG_VERSION" ]; then
    echo "NOTICE: This server uses egg version ${installed:-unknown}, but version $EGG_VERSION is available."
    echo "See https://github.com/devn1x/Screeps-Egg#updating-and-resetting for how to update."
fi

# Run the Server
eval ${STARTUP} 