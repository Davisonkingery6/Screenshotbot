@echo off
color 0D
echo.
echo ===== MONITOR CONFIGURATION =====
echo.
powershell -ExecutionPolicy Bypass -Command "Add-Type @'`nusing System;using System.Runtime.InteropServices;public class DPI{[DllImport(\"user32.dll\")]public static extern bool SetProcessDPIAware();}'@; [DPI]::SetProcessDPIAware(); Add-Type -A System.Windows.Forms; $m=[System.Windows.Forms.Screen]::AllScreens; Write-Host \"Total Monitors: $($m.Count)\" -F Magenta; Write-Host ''; for($i=0;$i -lt $m.Count;$i++){$mon=$m[$i]; Write-Host \"█ MONITOR $($i+1)\" -F $(if($mon.Primary){'Green'}else{'Cyan'}) -B $(if($mon.Primary){'DarkGreen'}else{'DarkCyan'}); Write-Host \"  Resolution: $($mon.Bounds.Width) × $($mon.Bounds.Height)\" -F White; Write-Host \"  Position: X=$($mon.Bounds.X), Y=$($mon.Bounds.Y)\" -F Gray; Write-Host \"  Primary: $(if($mon.Primary){'YES ⭐'}else{'No'})\" -F $(if($mon.Primary){'Yellow'}else{'Gray'}); Write-Host ''}"
echo.
pause