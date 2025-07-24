@echo off
title Screenshot Bot - Monitor 2 (1280x720)
color 0A
echo =====================================
echo    SCREENSHOT BOT - MONITOR 2
echo    Resolution: 1280x720
echo    Times: 4pm, 5pm, 6pm, 7pm
echo =====================================
echo.
powershell -ExecutionPolicy Bypass -NoExit -Command "[System.Windows.Forms.Application]::SetHighDpiMode('SystemAware'); Add-Type -A System.Windows.Forms,System.Drawing; Add-Type @' `n using System; `n using System.Runtime.InteropServices; `n public class DPI { `n [DllImport(\"user32.dll\")] public static extern bool SetProcessDPIAware(); `n [DllImport(\"shcore.dll\")] public static extern int SetProcessDpiAwareness(int value); `n } `n'@; try {[DPI]::SetProcessDpiAwareness(2)} catch {[DPI]::SetProcessDPIAware()}; Write-Host 'DPI-Aware Screenshot Bot Active' -F Green; $done=@{}; while(1){$now=Get-Date; $t=$now.ToString('HH:mm'); $k=$now.ToString('yyyyMMdd')+'-'+$t; if(@('16:00','17:00','18:00','19:00') -contains $t -and -not $done[$k]){$m=[System.Windows.Forms.Screen]::AllScreens; $mon=if($m.Count -gt 1){$m[1]}else{$m[0]}; Write-Host \"Capturing Monitor 2 at $t...\" -F Yellow; $b=$mon.Bounds; Write-Host \"Monitor bounds: $($b.Width) x $($b.Height) at X=$($b.X),Y=$($b.Y)\" -F Cyan; $bmp=New-Object Drawing.Bitmap 1280,720; $g=[Drawing.Graphics]::FromImage($bmp); $g.CopyFromScreen($b.X,$b.Y,0,0,[Drawing.Size]::new(1280,720)); md C:\Screenshots -ea 0; $f=\"C:\Screenshots\screenshot_$(Get-Date -F yyyyMMdd_HHmmss).png\"; $bmp.Save($f); $g.Dispose(); $bmp.Dispose(); Write-Host \"Saved: $f (1280x720)\" -F Green; $done[$k]=1; sleep 65}else{Write-Host \"`rTime: $($now.ToString('HH:mm:ss'))\" -NoNewline} sleep 5}"
