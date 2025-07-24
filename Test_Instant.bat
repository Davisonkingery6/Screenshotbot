@echo off
title Quick Test
color 0B
echo Testing screenshot capture...
echo.
powershell -ExecutionPolicy Bypass -Command "Add-Type -A System.Windows.Forms,System.Drawing; $m=[System.Windows.Forms.Screen]::AllScreens; $mon=if($m.Count -gt 1){$m[1]}else{$m[0]}; Write-Host \"Capturing Monitor $($m.IndexOf($mon)+1)...\" -F Yellow; $b=$mon.Bounds; $bmp=New-Object Drawing.Bitmap $b.Width,$b.Height; $g=[Drawing.Graphics]::FromImage($bmp); $g.CopyFromScreen($b.X,$b.Y,0,0,$bmp.Size); md C:\Screenshots -ea 0; $f=\"C:\Screenshots\TEST_NOW_$(Get-Date -F yyyyMMdd_HHmmss).png\"; $bmp.Save($f); $g.Dispose(); $bmp.Dispose(); Write-Host \"Saved: $f\" -F Green; Write-Host \"Size: $($b.Width) x $($b.Height)\" -F Cyan"
echo.
pause
