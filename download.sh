#!/bin/bash
echo "Welcome to yt-dlp application console controller (YACC)"
check_for_updates=1

if [ $check_for_updates -eq 1 ]; then
	bin/yt-dlp -U
else
	echo "Update check skipped."
fi

#get URL as user input
echo "Input URL:"; 
read video 

#download whatever is at the URL and convert it to .mp4 if not already
#using -o instead of --trim-filenames because on some unix-like filesystems the filename length 
#refers to length in bytes and not length of strings
bin/yt-dlp -f mp4 $video -o "%(uploader)s_%(id)s.%(ext)s"
