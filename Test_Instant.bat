@echo off
echo Testing both screens separately...
echo.
powershell -ExecutionPolicy Bypass -Command "Add-Type -AssemblyName System.Drawing; Write-Host 'Screen 1 (0,0 - 1280x720):' -F Yellow; $b1=New-Object System.Drawing.Bitmap(1280,720); $g1=[System.Drawing.Graphics]::FromImage($b1); $g1.CopyFromScreen(0,0,0,0,$b1.Size); md C:\Screenshots -ea 0; $b1.Save('C:\Screenshots\TEST_SCREEN1.png'); $g1.Dispose(); $b1.Dispose(); Write-Host 'Saved: TEST_SCREEN1.png' -F Green; Write-Host ''; Write-Host 'Screen 2 (1280,0 - 2560x720):' -F Cyan; $b2=New-Object System.Drawing.Bitmap(2560,720); $g2=[System.Drawing.Graphics]::FromImage($b2); $g2.CopyFromScreen(1280,0,0,0,$b2.Size); $b2.Save('C:\Screenshots\TEST_SCREEN2.png'); $g2.Dispose(); $b2.Dispose(); Write-Host 'Saved: TEST_SCREEN2.png' -F Green"
pause
