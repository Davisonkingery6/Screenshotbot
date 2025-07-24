@echo off
title Screenshot Bot - Monitor 2
color 0A
echo =====================================
echo    SCREENSHOT BOT - MONITOR 2
echo    Times: 4pm, 5pm, 6pm, 7pm
echo =====================================
echo.
echo Starting bot...
echo.
powershell -ExecutionPolicy Bypass -NoExit -Command "Add-Type -A System.Windows.Forms,System.Drawing; Write-Host 'Bot Active - Will capture at 16:00,17:00,18:00,19:00' -F Green; $done=@{}; while(1){$now=Get-Date; $t=$now.ToString('HH:mm'); $d=$now.ToString('yyyyMMdd'); $k=\"$d-$t\"; if(@('16:00','17:00','18:00','19:00') -contains $t -and -not $done.ContainsKey($k)){Write-Host \"Taking screenshot at $t...\" -F Yellow; $m=[System.Windows.Forms.Screen]::AllScreens; $mon=if($m.Count -gt 1){$m[1]}else{$m[0]}; $b=$mon.Bounds; $bmp=New-Object Drawing.Bitmap $b.Width,$b.Height; $g=[Drawing.Graphics]::FromImage($bmp); $g.CopyFromScreen($b.X,$b.Y,0,0,$bmp.Size); md C:\Screenshots -ea 0; $f=\"C:\Screenshots\screenshot_$(Get-Date -F yyyyMMdd_HHmmss).png\"; $bmp.Save($f); $g.Dispose(); $bmp.Dispose(); Write-Host \"Saved: $f\" -F Green; Write-Host \"Size: $($b.Width) x $($b.Height)\" -F Cyan; $done[$k]=1; sleep 65}else{Write-Host \"`rTime: $($now.ToString('HH:mm:ss')) - Waiting...\" -NoNewline} sleep 5}"
