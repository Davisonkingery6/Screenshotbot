@echo off
:loop
echo Checking time...
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    if "%%a:%%b"=="04:00 PM" goto capture
    if "%%a:%%b"=="05:00 PM" goto capture
    if "%%a:%%b"=="06:00 PM" goto capture
    if "%%a:%%b"=="07:00 PM" goto capture
)
timeout /t 30 /nobreak >nul
goto loop

:capture
echo Taking screenshot...
powershell -Command "Add-Type -A System.Drawing;$b=New-Object Drawing.Bitmap(2560,720);$g=[Drawing.Graphics]::FromImage($b);$g.CopyFromScreen(1280,0,0,0,$b.Size);md C:\Screenshots -ea 0;$b.Save(\\\"C:\Screenshots\S2_$(Get-Date -F yyyyMMddHHmmss).png\\\")"
timeout /t 65 /nobreak >nul
goto loop
