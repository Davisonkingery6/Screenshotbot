@echo off
echo Stopping Screenshot Bot...
taskkill /F /IM powershell.exe /FI "WINDOWTITLE eq *Screenshot*" >nul 2>&1
echo Bot stopped!
pause