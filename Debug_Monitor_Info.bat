@echo off
echo Checking virtual screen setup...
echo.
powershell -Command "[void][System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); $vi=[System.Windows.Forms.SystemInformation]::VirtualScreen; $pi=[System.Windows.Forms.SystemInformation]::PrimaryMonitorSize; Write-Host 'VIRTUAL SCREEN:' -F Magenta; Write-Host \"  Total Size: $($vi.Width) x $($vi.Height)\" -F White; Write-Host \"  Starting at: X=$($vi.X), Y=$($vi.Y)\" -F White; Write-Host ''; Write-Host 'PRIMARY MONITOR:' -F Green; Write-Host \"  Size: $($pi.Width) x $($pi.Height)\" -F White; Write-Host ''; Write-Host 'This tells us the actual desktop size Windows sees' -F Yellow"
pause
