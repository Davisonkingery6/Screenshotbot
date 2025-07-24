@echo off
color 0B
echo Testing Screen 1 (RIGHT monitor) capture...
echo.
powershell -ExecutionPolicy Bypass -Command "Add-Type -AssemblyName System.Windows.Forms,System.Drawing; $primary=[System.Windows.Forms.Screen]::PrimaryScreen; $x=$primary.Bounds.X; $y=$primary.Bounds.Y; Write-Host 'Screen Layout:' -F Yellow; Write-Host \"  Screen 1 (RIGHT): Starting at X=$x, Y=$y\" -F Green; Write-Host \"  Target size: 1920 x 1080\" -F Green; Write-Host 'Capturing...' -F Cyan; $bmp=New-Object System.Drawing.Bitmap 1920,1080; $g=[System.Drawing.Graphics]::FromImage($bmp); $g.CopyFromScreen($x,$y,0,0,[System.Drawing.Size]::new(1920,1080)); md C:\Screenshots -ea 0|Out-Null; $f=\"C:\Screenshots\TEST_RIGHT_SCREEN_$(Get-Date -F yyyyMMdd_HHmmss).png\"; $bmp.Save($f); $g.Dispose(); $bmp.Dispose(); Write-Host \"SUCCESS! Saved: $f\" -F Green -B DarkGreen; Write-Host 'Check C:\Screenshots' -F Yellow"
pause
