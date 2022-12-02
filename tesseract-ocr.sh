#!/bin/sh
# vim: set tabstop=8:softtabstop=8:shiftwidth=8:noexpandtab
#

if [ "$1" = "ara" ];then
	lang="$1"
else
	lang="eng"
fi

tmpdir=$(mktemp)
tmpimage="image.png"
tmptext="t_text"
maim --color=0.6,0.125,0.23 -b 4 -u -s "$tmpimage"
convert -bordercolor black  -border 20 "$tmpimage" "$tmpimage"
tesseract-ocr "$tmpimage" "$tmptext"  -l "$lang"
xclip -selection clipboard -in "$tmptext.txt" 
rm -R "$tmpdir" 
