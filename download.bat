@echo off


REM This script is in the public domain
REM Originally by Seth G. R. Herendeen

IF %1.==. GOTO No1
REM PROGRAM IS EXPECTING AN AUDIO FORMAT AS FIRST ARG. YT-DLP 
REM WILL NOT PERMIT PASSING OF A VIDEO FORMAT INSTEAD.
IF %2.==. GOTO No2
IF %3.==. GOTO No3

echo %1 ... %2 ... %3 (default: 16)
SET LENGTH=%3
GOTO ctr

:No1
  ECHO No param 1
GOTO start
:No2
  ECHO No param 2
GOTO start
:No3
  ECHO No param 3 (filename length). Fallback to default of 16.
  SET LENGTH=16

:ctr
bin\yt-dlp -x --audio-format %1 --trim-filenames %LENGTH% "%2"
goto EOF

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
bin\yt-dlp -x --audio-format flac --trim-filenames 16  %video%
GOTO EOF

:dl_vorbis
bin\yt-dlp -x --audio-format vorbis --trim-filenames 16  %video%
GOTO EOF

:dl_mp3
bin\yt-dlp -x -F mp3 --trim-filenames 16 --audio-format mp3 %video%
GOTO EOF

:dl_noconvert
SET video=%2
SET LENGTH=%3
bin\yt-dlp -k --trim-filenames %LENGTH% %video%

GOTO EOF

:dl
bin\yt-dlp -k --trim-filenames 16 %video%


:EOF
pause
echo.
echo.
echo Done!
exit
