@echo off
echo Creating DPI-aware PowerShell session...
echo.
powershell -Command "Add-Type -TypeDefinition @' `
using System; `
using System.Runtime.InteropServices; `
public class DPI { `
    [DllImport(\"shcore.dll\")] `
    public static extern int SetProcessDpiAwareness(int value); `
    [DllImport(\"user32.dll\")] `
    public static extern bool SetProcessDPIAware(); `
} `
'@; try {[DPI]::SetProcessDpiAwareness(2)} catch {[DPI]::SetProcessDPIAware()}; Add-Type -AssemblyName System.Windows.Forms; $screens=[System.Windows.Forms.Screen]::AllScreens; Write-Host 'DPI-AWARE SCREEN INFO:' -F Green; foreach($s in $screens){$label=if($s.Primary){'Screen 1 (PRIMARY)'}else{'Screen 2'}; Write-Host \"`n$label\" -F $(if($s.Primary){'Yellow'}else{'Cyan'}); Write-Host \"  Actual Bounds: $($s.Bounds.Width) x $($s.Bounds.Height)\" -F White; Write-Host \"  Position: X=$($s.Bounds.X), Y=$($s.Bounds.Y)\" -F Gray}"
pause
