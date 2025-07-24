@echo off
color 0E
echo =====================================
echo    TESTING SCREEN 2 CAPTURE
echo    Position: Starting at X=1280
echo    Size: 2560 x 720
echo =====================================
echo.
powershell -ExecutionPolicy Bypass -Command "Add-Type -AssemblyName System.Drawing; Write-Host 'TEST: Capturing Screen 2 (Left Monitor)' -F Yellow; Write-Host 'Position: X=1280, Y=0' -F Cyan; Write-Host 'Size: 2560 x 720' -F Cyan; Write-Host ''; Write-Host 'Capturing...' -F Green; $bmp=New-Object System.Drawing.Bitmap(2560,720); $g=[System.Drawing.Graphics]::FromImage($bmp); $g.CopyFromScreen(1280,0,0,0,[System.Drawing.Size]::new(2560,720)); md C:\Screenshots -ea 0; $f=\"C:\Screenshots\TEST_SCREEN2_$(Get-Date -F yyyyMMdd_HHmmss).png\"; $bmp.Save($f); $g.Dispose(); $bmp.Dispose(); Write-Host ''; Write-Host 'SUCCESS!' -F Green -BackgroundColor DarkGreen; Write-Host \"Saved to: $f\" -F Yellow; Write-Host ''; Write-Host 'Check the screenshot - it should show Screen 2 (left monitor)' -F White"
echo.
pause
