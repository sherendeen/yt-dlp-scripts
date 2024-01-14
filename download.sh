#!/bin/bash
echo "Welcome to yt-dlp application console controller (YACC)"
check_for_updates=1

if [ $check_for_updates -eq 1 ]; then
	bin/yt-dlp -U
else
	echo "Update check skipped."
fi
echo "Input URL:"; read video

#get playlist name if possible
playlist_title= bin/yt-dlp $video -I 1:1 --skip-download --print playlist_title

#download basic mp4 video
bin/yt-dlp -f mp4 $video
echo $playlist_title
#mkdir ~/Music/$playlist_title

