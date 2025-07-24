@echo off
title Screenshot Bot - Screen 2 [Visual Tracker]
mode con: cols=60 lines=25
color 0A
setlocal enabledelayedexpansion

echo ============================================
echo    SCREENSHOT BOT - SCREEN 2
echo    Target Times: 4PM, 5PM, 6PM, 7PM
echo ============================================
echo.

set shot1=NO
set shot2=NO  
set shot3=NO
set shot4=NO
set total=0

:loop
cls
echo ============================================
echo    SCREENSHOT BOT - SCREEN 2 
echo ============================================
echo.
echo  Current Time: %time%
echo  Current Date: %date%
echo.
echo  SCHEDULE STATUS:
echo  ----------------
echo  [4:00 PM] - %shot1%
echo  [5:00 PM] - %shot2%
echo  [6:00 PM] - %shot3%
echo  [7:00 PM] - %shot4%
echo.
echo  Total Captured Today: %total% / 4
echo.
echo ============================================

for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    set currenttime=%%a:%%b
)

if "%currenttime%"=="04:00 PM" if "%shot1%"=="NO" goto capture1
if "%currenttime%"=="05:00 PM" if "%shot2%"=="NO" goto capture2
if "%currenttime%"=="06:00 PM" if "%shot3%"=="NO" goto capture3
if "%currenttime%"=="07:00 PM" if "%shot4%"=="NO" goto capture4

echo  STATUS: Waiting for next scheduled time...
echo.
echo  Next Check in: 30 seconds
timeout /t 30 /nobreak >nul
goto loop

:capture1
set shot1=DONE
set /a total+=1
goto docapture

:capture2
set shot2=DONE
set /a total+=1
goto docapture

:capture3
set shot3=DONE
set /a total+=1
goto docapture

:capture4
set shot4=DONE
set /a total+=1
goto docapture

:docapture
echo.
echo  *** CAPTURING SCREENSHOT! ***
echo.
powershell -Command "Add-Type -A System.Drawing;$b=New-Object Drawing.Bitmap(2560,720);$g=[Drawing.Graphics]::FromImage($b);$g.CopyFromScreen(1280,0,0,0,$b.Size);md C:\Screenshots -ea 0|Out-Null;$f=\"C:\Screenshots\Screen2_$(Get-Date -F yyyyMMdd_HHmmss).png\";$b.Save($f);$g.Dispose();$b.Dispose();Write-Host \"  SAVED: $f\" -F Green"
echo.
echo  Waiting 65 seconds to avoid duplicates...
timeout /t 65 /nobreak >nul
goto loop
