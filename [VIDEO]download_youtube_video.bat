@echo off

REM This script is in the Public Domain
REM Originally made by Seth G. R. Herendeen

echo Input link representing video to be downloaded
set /p video=:
bin\yt-dlp -f mp4 %video%

pause
