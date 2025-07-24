@echo off
title Screenshot Bot - Full Desktop
color 0E
echo This captures the ENTIRE desktop (both screens)
echo.
powershell -ExecutionPolicy Bypass -NoExit -Command "Add-Type -AssemblyName System.Drawing; Write-Host 'Bot Started - Full Desktop (3840x720)' -F Yellow; $done=@{}; while(1){$t=(Get-Date).ToString('HH:mm'); $k=(Get-Date).ToString('yyyyMMdd')+$t; if('16:00','17:00','18:00','19:00' -contains $t -and !$done[$k]){Write-Host \"Taking FULL desktop screenshot at $t...\" -F Yellow; $bmp=New-Object System.Drawing.Bitmap(3840,720); $g=[System.Drawing.Graphics]::FromImage($bmp); $g.CopyFromScreen(0,0,0,0,[System.Drawing.Size]::new(3840,720)); md C:\Screenshots -ea 0|Out-Null; $f=\"C:\Screenshots\FULL_DESKTOP_$(Get-Date -F yyyyMMdd_HHmmss).png\"; $bmp.Save($f); $g.Dispose(); $bmp.Dispose(); Write-Host \"Saved: $f (3840x720)\" -F Green; $done[$k]=1; sleep 65} sleep 5}"
