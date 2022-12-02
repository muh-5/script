#!/bin/sh
#
# Authot: muhammed hussam
#

locker="xtrlock"
mlock="xautolock"
time=5

ulock=$(pgrep "xautolock")
if [ "$ulock" ]
then
	clock=$(printf "LOCK NOW\ndisable lock(enabled)" | dmenu -i -p "Lock Screen: " | awk '{ print $1 }')
else
	clock=$(printf "LOCK NOW\nenable lock(diasbled)" | dmenu -i -p "Lock Screen: " | awk '{ print $1}')
fi

[ "$clock" = "LOCK"	] 	&& "$locker"&
[ "$clock" = "disable"	] 	&& pkill "$mlock"
[ "$clock" = "enable"	] 	&& "$mlock" -time "$time" -locker "$locker"&
