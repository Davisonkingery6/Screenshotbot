@echo off
title Screenshot Bot
echo Starting Screenshot Bot...
echo.
powershell.exe -ExecutionPolicy Bypass -NoExit -Command "Write-Host 'Screenshot Bot - 4pm,5pm,6pm,7pm' -F Green; while($true){$t=Get-Date -F HH:mm; if('16:00','17:00','18:00','19:00' -contains $t){Add-Type -A System.Windows.Forms,System.Drawing; md C:\Screenshots -Force|Out-Null; $s=[System.Windows.Forms.Screen]::PrimaryScreen.Bounds; $b=New-Object System.Drawing.Bitmap $s.Width,$s.Height; $g=[System.Drawing.Graphics]::FromImage($b); $g.CopyFromScreen(0,0,0,0,$b.Size); $b.Save(\"C:\Screenshots\screenshot_$(Get-Date -F yyyyMMdd_HHmmss).png\"); Write-Host \"Screenshot saved at $(Get-Date)\" -F Green; Start-Sleep 61} Start-Sleep 30}"
