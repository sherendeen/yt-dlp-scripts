@echo off

REM This script is in the public domain
REM Originally by Seth G. R. Herendeen

:start
echo Input link representing video to be downloaded
set /p video=:
echo.
echo 1. convert to flac
echo 2. convert to vorbis
echo 3. convert to mp3
echo 4. just download the video
echo Conversion option:
set /p option=Type 1, 2, 3 or 4 and then press ENTER:
echo.
if %option%=="1" GOTO dl_flac
if %option%=="2" GOTO dl_vorbis
if %option%=="3" GOTO dl_mp3
if %option%=="4" GOTO dl
:dl_flac
bin\yt-dlp -x --audio-format --trim-filenames 16 flac %video%
GOTO EOF

:dl_vorbis
bin\yt-dlp -x --audio-format --trim-filenames 16 vorbis %video%
GOTO EOF

:dl_mp3
bin\yt-dlp -x -F mp3 --trim-filenames 16 --audio-format mp3 %video%
GOTO EOF

:dl
bin\yt-dlp -k --trim-filenames 16 %video%

:EOF
echo.
echo.
echo Done!
exit
