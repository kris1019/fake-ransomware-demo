$ErrorActionPreference = "SilentlyContinue"

# Harmless ransomware-awareness UI simulation.
# No files are encrypted, deleted, uploaded, or modified.

Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Win32 {
    [DllImport("user32.dll")] public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
    [DllImport("kernel32.dll")] public static extern IntPtr GetConsoleWindow();
}
"@

$hwnd = [Win32]::GetConsoleWindow()
[Win32]::ShowWindow($hwnd, 3) | Out-Null
$Host.UI.RawUI.WindowTitle = "CRYPTLOCK"
[Console]::CursorVisible = $false

$esc = [char]27
$files = @(
    "Documents\family_photos.zip",
    "Documents\financial_records.xlsx",
    "Desktop\projects\backup.dat",
    "Downloads\archive_01.bin",
    "Documents\school\notes.docx"
)

while ($true) {
    Clear-Host

    Write-Host "================================================================================" -ForegroundColor DarkRed
    Write-Host "                         CRYPTLOCK SECURITY NOTICE" -ForegroundColor Red
    Write-Host "================================================================================" -ForegroundColor DarkRed
    Write-Host ""
    Write-Host "                 YOUR FILES AND DOCUMENTS HAVE BEEN ENCRYPTED!" -ForegroundColor Red
    Write-Host ""
    Write-Host "     ████████████████" -ForegroundColor Cyan
    Write-Host "     ██            ██" -ForegroundColor Cyan
    Write-Host "     ██     🔒     ██" -ForegroundColor Cyan
    Write-Host "     ██            ██" -ForegroundColor Cyan
    Write-Host "     ████████████████" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "WHAT HAPPENED TO MY FILES?" -ForegroundColor Yellow
    Write-Host "Your documents, photos and other files are being shown as encrypted."
    Write-Host "Encryption algorithm: AES-256"
    Write-Host "Recovery identifier: CL-$((Get-Random -Minimum 100000 -Maximum 999999))"
    Write-Host ""
    Write-Host "FILES CURRENTLY DISPLAYED:" -ForegroundColor Yellow
    foreach ($f in $files) {
        Write-Host "  [+] $f" -ForegroundColor DarkGray
    }
    Write-Host ""
    Write-Host "TIME LEFT" -ForegroundColor Yellow
    Write-Host "                         23 : 59 : 59" -ForegroundColor Red
    Write-Host ""
    Write-Host "RECOVERY STATUS" -ForegroundColor Yellow
    Write-Host "  Recovery key: NOT AVAILABLE"
    Write-Host "  Data status : DISPLAY SIMULATION"
    Write-Host ""
    Write-Host "-------------------------------------------------------------------------------"
    Write-Host "  IMPORTANT: THIS WINDOW IS A HARMLESS SECURITY-AWARENESS DEMONSTRATION." -ForegroundColor Green
    Write-Host "  NO REAL FILES ARE BEING ENCRYPTED OR MODIFIED." -ForegroundColor Green
    Write-Host "-------------------------------------------------------------------------------"
    Write-Host ""
    Write-Host "  [Any key] Exit" -ForegroundColor Gray

    if ([Console]::KeyAvailable) {
        [Console]::ReadKey($true) | Out-Null
        break
    }

    Start-Sleep -Milliseconds 250
}

[Console]::CursorVisible = $true
Clear-Host
Write-Host "Security demonstration ended." -ForegroundColor Green
Start-Sleep -Milliseconds 700
