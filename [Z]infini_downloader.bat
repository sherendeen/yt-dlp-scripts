@echo off
title infini downloader bin\yt-dlp script

REM Seth Herendeen 2021-08-07
REM ... No Rights Reserved
REM ... This work is public domain
REM INITIAL MENU SCREEN
color 4b

:initial
cls
color af
echo Welcome to Infini Downloader, a bin\yt-dlp script. Version 1
echo This script is public domain.
echo.
echo.
echo 1) single download [download and then close]
echo 2) multidownload 
echo 3) clear cache 
echo 4) update
echo 5) download image
echo 6) download_interactively
echo 7) [exit]
set /p option=:

if %option%==1 goto download
if %option%==2 goto multidownload
if %option%==3 goto clear_cache
if %option%==4 goto update
if %option%==5 goto download_image
if %option%==6 goto download_interactively
if %option%==7 goto eof

echo Option input "%option%" is invalid. Please type option '1' or '2.'
goto initial

:update
cls
bin\yt-dlp -U
pause
goto eof


:multidownload
goto download

:download_from_file_path

cls
color fc
echo input URL for download
set /p path=:
bin\yt-dlp -a %path%
goto eof

:download_interactively_again
:download_interactively
@echo on
cls
color 3f
echo input URL for download
set /p video=:
bin\yt-dlp -f - %video%
echo " Download another like this? (Y - Yes | N - No) "
set /p opt=:
if %opt%=="y" goto multidownload
if %opt%=="Y" goto multidownload
if %opt%=="n" goto eof
if %opt%=="N" goto eof

:download_mp3_again
@echo on
cls
echo Input URL for mp3 download:
set /p video=:
:download_mp3
@echo on

bin\yt-dlp -x --audio-format mp3 %video%

if %option%==2 goto download_mp3_again

goto eof



:download_flac_again
cls
echo Input URL for flac download:
set /p flac_url=:
:download_flac

bin\yt-dlp -x --audio-format flac %flac_url%
if %option%==2 goto multidownload

REM fallthrough
goto eof


:download_image
cls
echo input URL for downloading thumbnail of video
set /p video=:
rem bin\yt-dlp --ignore-errors --write-thumbnail --skip-download $1 $2 $3 %video%
bin\yt-dlp --ignore-errors --write-thumbnail %video%
pause
goto eof


:download
cls
echo.
echo.
echo file type to download and save as
echo.
echo 1. download and convert to mp3
echo 2. download and convert to flac
echo 3. download without conversion
echo 4. download interactively (beta)
echo 5. download image
echo 6. download from file path (no conversion)
echo 7. return to [main menu]
echo 8. exit
echo.
set /p opt=:
REM download mp3 again is necessary even if one
rem mp3
if %opt%==1 goto download_mp3_again
rem flac
if %opt%==2 goto download_flac_again
rem no convert
if %opt%==3 goto download_no_convert

if %opt%==4 goto download_interactively
if %opt%==5 goto download_image
if %opt%==6 goto download_from_file_path
rem initial
if %opt%==7 goto initial

if %opt%==8 goto eof

:download_no_convert
cls
echo Input url that you wish to download from
set /p url=:
bin\yt-dlp.exe  --trim-filenames 16 %URL%
if %option%==2 goto multidownload
REM FALL THROUGH TO EOF



:eof

color 07
echo.
echo Goodbye
echo %status%
exit