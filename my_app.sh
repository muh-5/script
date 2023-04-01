#!/bin/sh

# Set a variable for the list file location
LIST_DIR="$HOME/.local/script/my_app.list"

# Use awk to extract the app names from the list file and remove any blank lines
APP_NAMES=$(awk -F":" '!/^$/ {print $1}' "$LIST_DIR")

# Use dmenu to prompt the user to select an app from the list
SELECTED_APP=$(echo "$APP_NAMES" | dmenu -l 15 -i -p "APP:")

# Use grep to find the selected app's command in the list file
APP_COMMAND=$(grep "^${SELECTED_APP}:" "$LIST_DIR" | awk -F":" '{print $2}')

# Run the selected app's command
eval "$APP_COMMAND"
