@echo off
echo Creating Screen2 bot script...
(
echo # Screen 2 Screenshot Bot
echo Add-Type -AssemblyName System.Drawing
echo Write-Host "Screenshot Bot Started - Screen 2" -ForegroundColor Green
echo Write-Host "Will capture at: 4pm, 5pm, 6pm, 7pm" -ForegroundColor Yellow
echo Write-Host ""
echo.
echo $done = @{}
echo while($true^) {
echo     $currentTime = (Get-Date^).ToString('HH:mm'^)
echo     $dateKey = (Get-Date^).ToString('yyyyMMdd'^) + $currentTime
echo.    
echo     if(@('16:00','17:00','18:00','19:00'^) -contains $currentTime -and -not $done[$dateKey]^) {
echo         Write-Host "Taking screenshot at $currentTime..." -ForegroundColor Green
echo         $bitmap = New-Object System.Drawing.Bitmap(2560, 720^)
echo         $graphics = [System.Drawing.Graphics]::FromImage($bitmap^)
echo         $graphics.CopyFromScreen(1280, 0, 0, 0, [System.Drawing.Size]::new(2560, 720^)^)
echo.        
echo         $path = "C:\Screenshots"
echo         if(!(Test-Path $path^)^) { New-Item -ItemType Directory -Path $path }
echo         $filename = "$path\Screen2_" + (Get-Date -Format 'yyyyMMdd_HHmmss'^) + ".png"
echo         $bitmap.Save($filename^)
echo.        
echo         $graphics.Dispose(^)
echo         $bitmap.Dispose(^)
echo.        
echo         Write-Host "Saved: $filename" -ForegroundColor Yellow
echo         $done[$dateKey] = $true
echo         Start-Sleep -Seconds 65
echo     }
echo     Start-Sleep -Seconds 5
echo }
) > Screen2_Bot.ps1

echo.
echo Script created: Screen2_Bot.ps1
echo.
echo Now run: Run_Screen2_Bot.bat
pause
