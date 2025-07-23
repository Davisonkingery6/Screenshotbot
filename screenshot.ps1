# Enhanced screenshot.ps1 with Monitor 2 + DPI Aware + All Features
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class DPI {
    [DllImport("user32.dll")]
    public static extern bool SetProcessDPIAware();
}
"@
[DPI]::SetProcessDPIAware()

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$scheduledTimes = @("16:00", "17:00", "18:00", "19:00")

# Get Monitor 2 (or fallback to primary if only 1 monitor)
$monitors = [System.Windows.Forms.Screen]::AllScreens
$selectedMonitor = if ($monitors.Count -gt 1) { $monitors[1] } else { $monitors[0] }
$monitorName = if ($monitors.Count -gt 1) { "Monitor 2" } else { "Primary Monitor" }

# Banner
Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "    SCREENSHOT BOT - ACTIVATED! " -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Capturing: $monitorName ($($selectedMonitor.Bounds.Width) x $($selectedMonitor.Bounds.Height))" -ForegroundColor Magenta
Write-Host "Schedule: $($scheduledTimes -join ', ')" -ForegroundColor Yellow
Write-Host "Today's Date: $(Get-Date -Format 'dddd, MMMM dd, yyyy')" -ForegroundColor White
Write-Host "========================================`n" -ForegroundColor Cyan

while ($true) {
    $currentTime = Get-Date -Format "HH:mm"
    
    if ($scheduledTimes -contains $currentTime) {
        # Visual alert
        Write-Host "`n⚡ SCREENSHOT TIME! ⚡" -ForegroundColor Yellow -BackgroundColor DarkRed
        Write-Host "Taking screenshot at $currentTime..." -ForegroundColor Green
        
        # Screenshot code
        $screenshotPath = "C:\Users\KHuang\OneDrive - Network Rail\Profile\Desktop\Screenshots"
        if (!(Test-Path $screenshotPath)) {
            New-Item -ItemType Directory -Path $screenshotPath | Out-Null
        }
        
        # Capture Monitor 2 with DPI awareness
        $bounds = $selectedMonitor.Bounds
        $bitmap = New-Object System.Drawing.Bitmap $bounds.Width, $bounds.Height
        $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
        $graphics.CopyFromScreen($bounds.X, $bounds.Y, 0, 0, $bitmap.Size)
        
        $timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
        $filename = Join-Path $screenshotPath "monitor_$timestamp.png"
        $bitmap.Save($filename, [System.Drawing.Imaging.ImageFormat]::Png)
        
        $graphics.Dispose()
        $bitmap.Dispose()
        
        # Success message
        Write-Host "✓ SUCCESS! Screenshot saved!" -ForegroundColor Green
        Write-Host "📁 Location: $filename" -ForegroundColor Cyan
        Write-Host "📏 Size: $($bounds.Width) x $($bounds.Height) pixels" -ForegroundColor Cyan
        Write-Host "🖥️ Monitor: $monitorName" -ForegroundColor Yellow
        
        # Log
        $logFile = Join-Path $screenshotPath "screenshot_log.txt"
        Add-Content -Path $logFile -Value "Screenshot taken: $filename at $(Get-Date) - $monitorName"
        
        # Count screenshots taken today
        $todayCount = (Get-ChildItem $screenshotPath -Filter "*.png" | 
            Where-Object {$_.CreationTime.Date -eq (Get-Date).Date}).Count
        Write-Host "📊 Screenshots today: $todayCount" -ForegroundColor Magenta
        
        Start-Sleep -Seconds 61
    } else {
        # Status line with more info
        $nextTime = $scheduledTimes | Where-Object { $_ -gt $currentTime } | Select-Object -First 1
        if ($nextTime) {
            $timeUntilNext = [datetime]::ParseExact($nextTime, "HH:mm", $null) - [datetime]::ParseExact($currentTime, "HH:mm", $null)
            $minutesLeft = [math]::Round($timeUntilNext.TotalMinutes)
            Write-Host "`r⏰ Time: $(Get-Date -Format 'HH:mm:ss') | Next: $nextTime | Countdown: $minutesLeft minutes    " -NoNewline -ForegroundColor Gray
        } else {
            Write-Host "`r✅ All done for today! | Time: $(Get-Date -Format 'HH:mm:ss') | Resume tomorrow at 16:00    " -NoNewline -ForegroundColor DarkGreen
        }
        
        Start-Sleep -Seconds 5
    }
}