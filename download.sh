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
bin/yt-dlp -f mp4 $video 
