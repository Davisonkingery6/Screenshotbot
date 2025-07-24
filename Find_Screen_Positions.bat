@echo off
color 0E
echo === FINDING EXACT SCREEN POSITIONS ===
echo.
powershell -ExecutionPolicy Bypass -Command "Add-Type -AssemblyName System.Windows.Forms; $all=[System.Windows.Forms.Screen]::AllScreens; foreach($s in $all){if($s.Primary){Write-Host 'SCREEN 1 (PRIMARY - RIGHT):' -F Green -B DarkGreen; Write-Host \"  Position: X = $($s.Bounds.X), Y = $($s.Bounds.Y)\" -F Yellow; Write-Host \"  Size: $($s.Bounds.Width) x $($s.Bounds.Height)\" -F Yellow; $global:primaryX=$s.Bounds.X; $global:primaryY=$s.Bounds.Y}else{Write-Host 'SCREEN 2 (LEFT):' -F Cyan -B DarkCyan; Write-Host \"  Position: X = $($s.Bounds.X), Y = $($s.Bounds.Y)\" -F White; Write-Host \"  Size: $($s.Bounds.Width) x $($s.Bounds.Height)\" -F White}}"
pause