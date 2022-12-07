#!/bin/sh
# vim: set tabstop=8:softtabstop=8:shiftwidth=8:noexpandtab

if [ ! -f "$1" ];then
	lang="eng"
else
	lang="$1"
fi

tmpdir=$(mktemp -d)
tmpimage="$tmpdir/image.png"
tmptext="$tmpdir/t_text"
maim --color=0.6,0.125,0.23 -b 4 -u -s "$tmpimage"
convert -bordercolor black  -border 20 "$tmpimage" "$tmpimage"
tesseract-ocr "$tmpimage" "$tmptext"  -l "$lang"
xclip -selection clipboard -in "$tmptext.txt"
quote="$(head $tmptext.txt)"
herbe "tesseract-ocr.sh: copy selected text in $lang""$quote""......."
rm -R "$tmpdir" 
