@echo off
color 0B
echo Testing Screen 1 capture...
powershell -ExecutionPolicy Bypass -Command "Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $mon=[System.Windows.Forms.Screen]::PrimaryScreen; Write-Host 'Capturing Primary Screen (Screen 1)' -F Green; Write-Host \"Screen 1 position: X=$($mon.Bounds.X), Y=$($mon.Bounds.Y)\" -F Yellow; $bmp=New-Object System.Drawing.Bitmap 1280,720; $g=[System.Drawing.Graphics]::FromImage($bmp); $g.CopyFromScreen($mon.Bounds.X,$mon.Bounds.Y,0,0,$bmp.Size); md C:\Screenshots -ea 0|Out-Null; $f=\"C:\Screenshots\TEST_SCREEN1_$(Get-Date -F yyyyMMdd_HHmmss).png\"; $bmp.Save($f); $g.Dispose(); $bmp.Dispose(); Write-Host \"Screenshot saved: $f\" -F Green; Write-Host 'Size: 1280x720' -F Cyan"
pause
