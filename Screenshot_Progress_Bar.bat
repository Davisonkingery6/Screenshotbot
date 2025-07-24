@echo off
title Screenshot Bot - Progress Tracker
color 0A
set done=0

:main
cls
echo ============================================
echo          SCREENSHOT BOT v2.0
echo ============================================
echo.
echo  Schedule: 4PM, 5PM, 6PM, 7PM
echo  Target: Screen 2 (2560x720)
echo.
echo  Progress: [
if %done% GEQ 1 (echo|set /p=#) else (echo|set /p=-)
if %done% GEQ 2 (echo|set /p=#) else (echo|set /p=-)
if %done% GEQ 3 (echo|set /p=#) else (echo|set /p=-)
if %done% GEQ 4 (echo|set /p=#) else (echo|set /p=-)
echo ] %done%/4
echo.
echo  Current: %time%
echo.

for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    set hr=%%a
    set period=%%b
)

if "%hr%:%period%"=="04:00 PM" goto cap
if "%hr%:%period%"=="05:00 PM" goto cap
if "%hr%:%period%"=="06:00 PM" goto cap
if "%hr%:%period%"=="07:00 PM" goto cap

echo  Status: Monitoring...
timeout /t 20 /nobreak >nul
goto main

:cap
if %done% GEQ 4 goto main
set /a done+=1
echo.
echo  [!] SCREENSHOT TIME DETECTED!
echo  [*] Capturing Screen 2...
powershell -Command "Add-Type -A System.Drawing;$b=New-Object Drawing.Bitmap(2560,720);$g=[Drawing.Graphics]::FromImage($b);$g.CopyFromScreen(1280,0,0,0,$b.Size);md C:\Screenshots -ea 0;$fn=\"C:\Screenshots\Screen2_$(Get-Date -F yyyyMMdd_HHmmss).png\";$b.Save($fn);Write-Host \"  [+] Saved: $fn\" -F Green"
echo  [*] Cooldown period...
timeout /t 65 /nobreak >nul
goto main
