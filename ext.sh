#!/bin/sh

choice=$(printf "Exit\nLogout\nShutdown\nReboot" | dmenu -l 4 -i -p "Choice Your Action: ")

[ "$choice" = "Logout"	 ] && pkill sh 
[ "$choice" = "Shutdown" ] && doas poweroff 
[ "$choice" = "Reboot"	 ] && doas reboot 
