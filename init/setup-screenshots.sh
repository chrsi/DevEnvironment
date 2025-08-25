#!/bin/bash

# Idempotent bash script to setup Screenshots folder
# This script will:
# 1. Create ~/Screenshots folder if it doesn't exist
# 2. Set it as the default screenshot location
# 3. Add the Screenshots folder to the dock
# 
# Prerequisites: dockutil must be installed

set -e  # Exit on any error

SCREENSHOTS_DIR="$HOME/Screenshots"

echo "Setting up Screenshots folder..."

# 1. Create Screenshots folder if it doesn't exist
if [ ! -d "$SCREENSHOTS_DIR" ]; then
    echo "Creating Screenshots folder at $SCREENSHOTS_DIR"
    mkdir -p "$SCREENSHOTS_DIR"
else
    echo "Screenshots folder already exists at $SCREENSHOTS_DIR"
fi

# 2. Change default screenshot location
echo "Setting default screenshot location to $SCREENSHOTS_DIR"
defaults write com.apple.screencapture location "$SCREENSHOTS_DIR"

# Restart SystemUIServer to apply changes
killall SystemUIServer 2>/dev/null || true

# 3. Add Screenshots folder to dock (only if not already present)
echo "Checking if Screenshots folder is in the dock..."

# Check if Screenshots folder is already in the dock
if ! dockutil --list | grep -q "$SCREENSHOTS_DIR"; then
    echo "Adding Screenshots folder to dock..."
    dockutil --add "$SCREENSHOTS_DIR" --view fan --display folder --sort name
else
    echo "Screenshots folder is already in the dock"
fi

echo "Screenshots setup complete!"
echo "- Screenshots folder: $SCREENSHOTS_DIR"
echo "- Default screenshot location updated"
echo "- Folder added to dock"
echo ""
echo "Note: You may need to restart your Mac or log out/in for all changes to take effect."
