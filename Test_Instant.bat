@echo off
color 0B
echo Testing screenshot...
powershell -ExecutionPolicy Bypass -Command "Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $all=[System.Windows.Forms.Screen]::AllScreens; Write-Host \"Monitors found: $($all.Count)\" -F Yellow; $mon=$all[0]; if($all.Count -gt 1){$mon=$all[1]; Write-Host 'Using Monitor 2' -F Green} else {Write-Host 'Using Primary Monitor' -F Green}; $bmp=New-Object System.Drawing.Bitmap 1280,720; $g=[System.Drawing.Graphics]::FromImage($bmp); $g.CopyFromScreen($mon.Bounds.X,$mon.Bounds.Y,0,0,$bmp.Size); md C:\Screenshots -ea 0|Out-Null; $f=\"C:\Screenshots\TEST_$(Get-Date -F yyyyMMdd_HHmmss).png\"; $bmp.Save($f); $g.Dispose(); $bmp.Dispose(); Write-Host \"Screenshot saved: $f\" -F Green; Write-Host 'Size: 1280x720' -F Cyan"
pause
