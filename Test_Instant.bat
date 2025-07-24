@echo off
title Test Monitor 2 - DPI Fixed
color 0B
echo Testing Monitor 2 capture (1280x720)...
echo.
powershell -ExecutionPolicy Bypass -Command "[void][System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [void][System.Reflection.Assembly]::LoadWithPartialName('System.Drawing'); Add-Type @' `n using System; `n using System.Runtime.InteropServices; `n public class DPI { `n [DllImport(\"user32.dll\")] public static extern bool SetProcessDPIAware(); `n } `n'@; [DPI]::SetProcessDPIAware(); $monitors=[System.Windows.Forms.Screen]::AllScreens; Write-Host \"Found $($monitors.Count) monitor(s)\" -F Yellow; $mon=if($monitors.Count -gt 1){$monitors[1]}else{$monitors[0]}; $monNum=if($monitors.Count -gt 1){2}else{1}; $b=$mon.Bounds; Write-Host \"Capturing Monitor $monNum\" -F Green; Write-Host \"Original bounds: $($b.Width) x $($b.Height) at X=$($b.X), Y=$($b.Y)\" -F Cyan; Write-Host 'Creating 1280x720 screenshot...' -F Yellow; $bmp=New-Object System.Drawing.Bitmap 1280,720; $g=[System.Drawing.Graphics]::FromImage($bmp); $g.CopyFromScreen($b.X,$b.Y,0,0,[System.Drawing.Size]::new(1280,720)); md C:\Screenshots -ea 0; $f=\"C:\Screenshots\TEST_MONITOR2_$(Get-Date -F yyyyMMdd_HHmmss).png\"; $bmp.Save($f); $g.Dispose(); $bmp.Dispose(); Write-Host \"Saved: $f\" -F Green; Write-Host 'Success! Check C:\Screenshots' -F Green"
echo.
pause
