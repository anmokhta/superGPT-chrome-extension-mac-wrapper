#!/bin/bash

# Name of your .app bundle (change if needed)
APP_NAME="SuperGPT.app"

# Get the absolute path to this script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Path to the .app in the same directory as the script
APP_PATH="$SCRIPT_DIR/$APP_NAME"

# Resource directory inside the .app
RESOURCES_DIR="$APP_PATH/Contents/Resources"

# Parent directory (one level above script location)
PARENT_DIR="$(dirname "$SCRIPT_DIR")"

# Source files from parent directory
CHROMIUM_SRC="$PARENT_DIR/Chromium.app"
SCRIPT_SRC="$PARENT_DIR/site-script.sh"
EXTENSION_SRC="$PARENT_DIR/Superpower-ChatGPT"

echo "Injecting resources into $RESOURCES_DIR..."

mkdir -p "$RESOURCES_DIR"

if [ -d "$CHROMIUM_SRC" ]; then
    echo "Copying Chromium.app..."
    cp -R "$CHROMIUM_SRC" "$RESOURCES_DIR/"
else
    echo "❌ Chromium.app not found at $CHROMIUM_SRC"
fi

if [ -f "$SCRIPT_SRC" ]; then
    echo "Copying site-script.sh..."
    cp "$SCRIPT_SRC" "$RESOURCES_DIR/"
else
    echo "❌ site-script.sh not found at $SCRIPT_SRC"
fi

if [ -d "$EXTENSION_SRC" ]; then
    echo "Copying Superpower-ChatGPT..."
    cp -R "$EXTENSION_SRC" "$RESOURCES_DIR/"
else
    echo "❌ Superpower-ChatGPT not found at $EXTENSION_SRC"
fi

echo "✅ Injection complete."