#!/bin/bash
echo "Welcome to yt-dlp application console controller (YACC)"
check_for_updates=1
format="mp3"
if [ $check_for_updates -eq 1 ]; then
	bin/yt-dlp -U
else
	echo "Update check skipped."
fi
echo "Input URL:"; read video

#download basic mp4 video
bin/yt-dlp -x --audio-format $format $video

echo "Moving $format files"
find . -name '*.mp3' -print -exec mv '{}' ~/Music \;
