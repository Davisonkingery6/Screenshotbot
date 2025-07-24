@echo off
echo === SCREENSHOT BOT STATUS ===
echo.
dir C:\Screenshots\*.png /o-d 2>nul | find "screenshot"
echo.
echo Total Screenshots: 
dir C:\Screenshots\*.png 2>nul | find "File(s)" 
echo.
pause