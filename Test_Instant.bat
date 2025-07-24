@echo off
echo Capturing Screen 1 (Primary) - 1280x720
echo.
powershell -ExecutionPolicy Bypass -Command "Add-Type -AssemblyName System.Drawing; Write-Host 'Capturing Screen 1 from position 0,0...' -F Yellow; $bmp=New-Object System.Drawing.Bitmap(1280,720); $g=[System.Drawing.Graphics]::FromImage($bmp); $g.CopyFromScreen(0,0,0,0,[System.Drawing.Size]::new(1280,720)); md C:\Screenshots -ea 0; $f=\"C:\Screenshots\TEST_SCREEN1_$(Get-Date -F yyyyMMdd_HHmmss).png\"; $bmp.Save($f); $g.Dispose(); $bmp.Dispose(); Write-Host \"Saved: $f\" -F Green; Write-Host 'This should show ONLY Screen 1' -F Cyan"
pause
