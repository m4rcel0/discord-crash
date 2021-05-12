@echo off

title Discord Crash/Reload Video Generator

set /p video=Drag and drop the original video here and press ENTER: 
set name=output
set /p name=Name the resulting crash video: 
set newvideo=%name%.mp4

echo.
echo Updating video properties...
@echo off
ffmpeg -nostats -loglevel 0 -i %video% -pix_fmt yuv422p temp.mp4

echo file temp.mp4 > files.txt
echo file assets/broken-video.mp4 >> files.txt

echo.
echo Generating crash video...
@echo off
ffmpeg -nostats -loglevel 0 -f concat -i files.txt -codec copy %newvideo%

echo.
echo Removing temporary files...
@echo off
del temp.mp4 files.txt

echo.
echo Crash video created successufully at: %CD%\%newvideo%
echo.
pause