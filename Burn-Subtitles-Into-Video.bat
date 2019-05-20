@echo off
title Burn Subtitles Into Video
for /f "tokens=*" %%i in ('dir/b *.mp4') do (
ffmpeg.exe -i %%i -vf subtitles=%%~ni.en.srt HD\%%~ni.mp4
if errorlevel 1 (
	echo Errors generated during burning subtitles into video "%%i", original files not deleted.
	) else (
	del /f "%%i" "%%~ni.en.srt"
	echo Successfully burned subtitles into video "%%i", original files deleted.
	)
)
echo Please check if successfully burned all subtitles into videos.
pause
