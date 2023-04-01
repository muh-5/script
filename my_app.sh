#!/bin/sh

# Set a variable for the list file location
LIST_DIR="$HOME/.local/script/my_app.list"

# Use awk to extract the app names and commands from the list file
APP_INFO=$(awk -F":" '{print $1 " " $2}' "$LIST_DIR")

# Use dmenu to prompt the user to select an app from the list
SELECTED_APP=$(echo "$APP_INFO" | awk '{print $1}' | dmenu)

# Get the selected app's command from the app info
APP_COMMAND=$(echo "$APP_INFO" | awk -v app="$SELECTED_APP" '$1 == app {print $2}')

# Run the selected app's command
exec "$APP_COMMAND"
