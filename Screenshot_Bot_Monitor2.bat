@echo off
title Screenshot Bot - Screen 2 [Visual]
color 0B
echo =====================================
echo    SCREENSHOT BOT - SCREEN 2
echo    Position: 1280,0
echo    Size: 2560 x 720
echo    Times: 4pm, 5pm, 6pm, 7pm
echo =====================================
echo.
powershell -ExecutionPolicy Bypass -NoExit -Command "Add-Type -AssemblyName System.Drawing; Write-Host ''; Write-Host '===================================' -F Cyan; Write-Host '   SCREENSHOT BOT ACTIVATED' -F Green; Write-Host '   TARGET: SCREEN 2 (LEFT)' -F Yellow; Write-Host '   RESOLUTION: 2560 x 720' -F Yellow; Write-Host '===================================' -F Cyan; Write-Host ''; $done=@{}; $total=0; while(1){$t=(Get-Date).ToString('HH:mm'); $k=(Get-Date).ToString('yyyyMMdd')+$t; if('16:00','17:00','18:00','19:00' -contains $t -and !$done[$k]){$total++; Write-Host ''; Write-Host '[SCREENSHOT TIME!]' -F Yellow -BackgroundColor DarkRed; Write-Host \"TIME: $t\" -F Green; Write-Host 'STATUS: Capturing Screen 2...' -F Cyan; $bmp=New-Object System.Drawing.Bitmap(2560,720); $g=[System.Drawing.Graphics]::FromImage($bmp); $g.CopyFromScreen(1280,0,0,0,[System.Drawing.Size]::new(2560,720)); md C:\Screenshots -ea 0|Out-Null; $f=\"C:\Screenshots\Screen2_$(Get-Date -F yyyyMMdd_HHmmss).png\"; $bmp.Save($f); $g.Dispose(); $bmp.Dispose(); Write-Host 'RESULT: SUCCESS!' -F Green -BackgroundColor DarkGreen; Write-Host \"FILE: $f\" -F White; Write-Host \"PROGRESS: $total/4 screenshots today\" -F Magenta; Write-Host '===================================' -F Gray; $done[$k]=1; sleep 65}else{$next='16:00','17:00','18:00','19:00'|?{$_ -gt $t}|select -First 1; if(!$next){$next='Done for today'}; Write-Host \"`rTIME: $(Get-Date -F 'HH:mm:ss') | NEXT: $next | TODAY: $($done.Count)/4\" -NoNewline -F Gray} sleep 5}"
