@echo off
title Monitor Debug Info
color 0D
echo === DETAILED MONITOR INFO ===
echo.
powershell -ExecutionPolicy Bypass -Command "Add-Type -A System.Windows.Forms; Add-Type @' `n using System; `n using System.Runtime.InteropServices; `n public class DPI { `n [DllImport(\"user32.dll\")] public static extern bool SetProcessDPIAware(); `n [DllImport(\"user32.dll\")] public static extern int GetSystemMetrics(int nIndex); `n [DllImport(\"user32.dll\")] public static extern int GetDeviceCaps(IntPtr hdc, int nIndex); `n } `n'@; [DPI]::SetProcessDPIAware(); $m=[System.Windows.Forms.Screen]::AllScreens; Write-Host \"Total Monitors: $($m.Count)\" -F Magenta; Write-Host \"Virtual Screen: $([DPI]::GetSystemMetrics(78)) x $([DPI]::GetSystemMetrics(79))\" -F Yellow; Write-Host ''; for($i=0;$i -lt $m.Count;$i++){$mon=$m[$i]; Write-Host \"MONITOR $($i+1):\" -F Cyan; Write-Host \"  Device Name: $($mon.DeviceName)\" -F White; Write-Host \"  Primary: $($mon.Primary)\" -F $(if($mon.Primary){'Yellow'}else{'Gray'}); Write-Host \"  Bounds: $($mon.Bounds.Width) x $($mon.Bounds.Height)\" -F Green; Write-Host \"  Position: X=$($mon.Bounds.X), Y=$($mon.Bounds.Y)\" -F Green; Write-Host \"  Working Area: $($mon.WorkingArea.Width) x $($mon.WorkingArea.Height)\" -F Gray; Write-Host ''}"
echo.
echo If Monitor 2 shows as 1280x720, the scripts will work correctly.
echo If it shows as 640x360, you have 200% scaling.
echo.
pause