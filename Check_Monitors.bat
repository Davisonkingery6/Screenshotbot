@echo off
color 0D
title Monitor Check
echo.
echo ===== MONITOR CONFIGURATION =====
echo.
powershell -ExecutionPolicy Bypass -Command "Add-Type -AssemblyName System.Windows.Forms; $m=[System.Windows.Forms.Screen]::AllScreens; Write-Host \"Total Monitors: $($m.Count)\" -F Magenta; for($i=0;$i -lt $m.Count;$i++){$mon=$m[$i]; Write-Host \"`nMONITOR $($i+1):\" -F Cyan; Write-Host \"  Resolution: $($mon.Bounds.Width) x $($mon.Bounds.Height)\" -F White; Write-Host \"  Primary: $(if($mon.Primary){'YES'}else{'No'})\" -F Yellow}"
echo.
pause
