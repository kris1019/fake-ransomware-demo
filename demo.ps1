$ErrorActionPreference = "SilentlyContinue"

# DISPLAY-ONLY SECURITY AWARENESS SIMULATION
# Nothing is encrypted, deleted, uploaded, or modified.

Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Win32 {
    [DllImport("user32.dll")]
    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
    [DllImport("kernel32.dll")]
    public static extern IntPtr GetConsoleWindow();
}
"@

$hwnd = [Win32]::GetConsoleWindow()
[Win32]::ShowWindow($hwnd, 3) | Out-Null

$Host.UI.RawUI.WindowTitle = "CRYPTLOCK // FILE ENCRYPTION SIMULATION"
$Host.UI.RawUI.ForegroundColor = "White"
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host
[Console]::CursorVisible = $false

$cat = @"
                 /\_/\\
                ( o.o )
                 > ^ <
"@

$files = @(
    "C:\Users\Public\Documents\invoice_2026.xlsx",
    "C:\Users\Public\Documents\family_photos.zip",
    "C:\Users\Public\Desktop\projects\backup.dat",
    "C:\Users\Public\Downloads\archive_01.bin",
    "C:\Users\Public\Documents\school\notes.docx"
)

$chars = "0123456789ABCDEF"

function Draw-Screen {
    param([int]$progress)

    Clear-Host

    Write-Host "╔══════════════════════════════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor DarkRed
    Write-Host "║                         CRYPTLOCK // SECURITY INCIDENT                                               ║" -ForegroundColor Red
    Write-Host "╠══════════════════════════════════════════════════════════════════════════════════════════════════════╣" -ForegroundColor DarkRed
    Write-Host "║  [!] FILE ENCRYPTION SIMULATION                                                                       ║" -ForegroundColor Red
    Write-Host "║                                                                                                      ║"
    Write-Host "║  YOUR FILES ARE BEING PROCESSED                                                                       ║" -ForegroundColor Red
    Write-Host "║  STATUS: $progress% COMPLETE                                                                            ║"
    Write-Host "║                                                                                                      ║"

    foreach ($file in $files) {
        $shown = $file
        if ($shown.Length -gt 82) { $shown = $shown.Substring(0,82) }
        Write-Host ("║  {0,-94}║" -f $shown) -ForegroundColor DarkGray
    }

    Write-Host "║                                                                                                      ║"
    Write-Host "║  KEY ID: SIM-$((Get-Random -Minimum 10000 -Maximum 99999))-$((Get-Random -Minimum 1000 -Maximum 9999))                                                        ║" -ForegroundColor Yellow
    Write-Host "║  ALGORITHM: AES-256 (SIMULATED)                                                                      ║" -ForegroundColor Yellow
    Write-Host "║  FILES MODIFIED: 0                                                                                   ║" -ForegroundColor Green
    Write-Host "║                                                                                                      ║"
    Write-Host "║                              $cat" -ForegroundColor Cyan
    Write-Host "║                                                                                                      ║"
    Write-Host "╠══════════════════════════════════════════════════════════════════════════════════════════════════════╣" -ForegroundColor DarkRed
    Write-Host "║  SECURITY AWARENESS DEMO — NO REAL FILES ARE TOUCHED                                                  ║" -ForegroundColor Green
    Write-Host "║                                                                                                      ║"
    Write-Host "║  [ENTER] EXIT SIMULATION                                                                             ║" -ForegroundColor White
    Write-Host "╚══════════════════════════════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor DarkRed
}

while (-not [Console]::KeyAvailable) {
    Draw-Screen -progress (Get-Random -Minimum 12 -Maximum 98)
    Start-Sleep -Milliseconds 700
}

[Console]::ReadKey($true) | Out-Null

Clear-Host
[Console]::CursorVisible = $true
Write-Host ""
Write-Host "  SIMULATION TERMINATED" -ForegroundColor Green
Write-Host ""
Write-Host "  Nothing was encrypted, deleted, uploaded, or changed." -ForegroundColor Green
Write-Host ""
Start-Sleep -Milliseconds 1200
