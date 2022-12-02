#!/bin/sh
TEMP_FILE="$(mktemp)"
doas xbps-install -Sun > $TEMP_FILE

#INFO=$(doas xbps-install -Sun)
#echo $INFO > $TEMP_FILE
herbe "$(awk '{print $1 }' $TEMP_FILE)"
rm $TEMP_FILE
