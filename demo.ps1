$ErrorActionPreference = "SilentlyContinue"

# HARMLESS FULLSCREEN VISUAL PRANK
# No files are read, encrypted, deleted, uploaded, or modified.

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::None
$form.WindowState = [System.Windows.Forms.FormWindowState]::Maximized
$form.BackColor = [System.Drawing.Color]::Black
$form.TopMost = $true
$form.KeyPreview = $true

$font = New-Object System.Drawing.Font("Consolas", 22, [System.Drawing.FontStyle]::Bold)
$small = New-Object System.Drawing.Font("Consolas", 12, [System.Drawing.FontStyle]::Regular)

$label = New-Object System.Windows.Forms.Label
$label.Dock = [System.Windows.Forms.DockStyle]::Fill
$label.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$label.Font = $font
$label.ForeColor = [System.Drawing.Color]::Red
$label.BackColor = [System.Drawing.Color]::Black
$form.Controls.Add($label)

$messages = @(
    "!! SECURITY BREACH DETECTED !!",
    "",
    "SYSTEM INTEGRITY COMPROMISED",
    "",
    "UNAUTHORIZED ACCESS DETECTED",
    "SCANNING LOCAL SYSTEM...",
    "",
    "CRITICAL WARNING",
    "",
    "DATA ACCESS: SIMULATED",
    "ENCRYPTION: SIMULATED",
    "",
    "DO NOT PANIC",
    "",
    "SECURITY SIMULATION ACTIVE"
)

$i = 0
$flash = $false

$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 500
$timer.Add_Tick({
    $flash = -not $flash
    if ($flash) {
        $label.ForeColor = [System.Drawing.Color]::Red
        $label.Text = $messages[$i % $messages.Count]
        $i++
    } else {
        $label.ForeColor = [System.Drawing.Color]::DarkRed
        $label.Text = $messages[$i % $messages.Count]
    }
})

# Any key exits the visual prank.
$form.Add_KeyDown({
    $form.Close()
})

$timer.Start()
[void]$form.ShowDialog()
$timer.Stop()
$form.Dispose()
