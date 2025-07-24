@echo off
title Screen 2 Bot [Visual]
color 0B
set count=0

:loop
cls
echo =====================================
echo    SCREEN 2 SCREENSHOT BOT
echo =====================================
echo.
echo  Time: %time%
echo  Screenshots Today: %count% / 4
echo.

for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    if "%%a:%%b"=="04:00 PM" goto shoot
    if "%%a:%%b"=="05:00 PM" goto shoot
    if "%%a:%%b"=="06:00 PM" goto shoot
    if "%%a:%%b"=="07:00 PM" goto shoot
)

echo  [WAITING] Next check in 10 seconds...
timeout /t 10 /nobreak >nul
goto loop

:shoot
set /a count+=1
echo.
echo  [CAPTURING] Taking screenshot %count%...
echo.
powershell -Command "Add-Type -A System.Drawing;$b=New-Object Drawing.Bitmap(2560,720);$g=[Drawing.Graphics]::FromImage($b);$g.CopyFromScreen(1280,0,0,0,$b.Size);md C:\Screenshots -ea 0;$b.Save(\"C:\Screenshots\S2_$(Get-Date -F yyyyMMddHHmmss).png\");Write-Host '  [SUCCESS] Screenshot saved!' -F Green"
echo.
echo  [COOLDOWN] Waiting 65 seconds...
timeout /t 65 /nobreak >nul
goto loop
