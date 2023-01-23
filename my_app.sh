#!/bin/sh

list_dir="$HOME/.local/script/my_app.list"
app_select=$(awk -F":" '{print $1}' < "$list_dir" | sed '/^$/d' | dmenu -l 15 -i -p "APP:")
app_run=$(grep  "$app_select" "$list_dir" | awk -F":" '{ print $2}')
$app_run
