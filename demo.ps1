Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Harmless ransomware-awareness simulation.
# No user files are read, encrypted, deleted, modified, or uploaded.

$form = New-Object System.Windows.Forms.Form
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::None
$form.WindowState = [System.Windows.Forms.FormWindowState]::Maximized
$form.BackColor = [System.Drawing.Color]::Black
$form.TopMost = $true
$form.KeyPreview = $true

$panel = New-Object System.Windows.Forms.Panel
$panel.Dock = [System.Windows.Forms.DockStyle]::Fill
$panel.BackColor = [System.Drawing.Color]::Black
$form.Controls.Add($panel)

function Add-Text {
    param([string]$Text,[int]$X,[int]$Y,[int]$Size,[System.Drawing.Color]$Color)
    $label = New-Object System.Windows.Forms.Label
    $label.Text = $Text
    $label.ForeColor = $Color
    $label.BackColor = [System.Drawing.Color]::Black
    $label.Font = New-Object System.Drawing.Font('Consolas',$Size,[System.Drawing.FontStyle]::Bold)
    $label.AutoSize = $true
    $label.Location = New-Object System.Drawing.Point($X,$Y)
    $panel.Controls.Add($label)
    return $label
}

$title = Add-Text '!!! CATNAP HAS ENCRYPTED YOUR FILES !!!' 55 28 22 ([System.Drawing.Color]::Red)
$warning = Add-Text 'CATNAP // FELINE ENCRYPTION SYSTEM' 60 100 15 ([System.Drawing.Color]::White)
Add-Text 'Your recovery window is running.' 60 135 14 ([System.Drawing.Color]::White) | Out-Null

Add-Text 'CATNAP COUNTDOWN' 65 190 12 ([System.Drawing.Color]::Gray) | Out-Null
$countdownLabel = Add-Text '24:00:00' 60 210 34 ([System.Drawing.Color]::Red)

Add-Text 'ENTER CATNAP RECOVERY KEY' 60 295 14 ([System.Drawing.Color]::White) | Out-Null
$keyBox = New-Object System.Windows.Forms.TextBox
$keyBox.Size = New-Object System.Drawing.Size(570,48)
$keyBox.Font = New-Object System.Drawing.Font('Consolas',18)
$keyBox.BackColor = [System.Drawing.Color]::FromArgb(20,20,20)
$keyBox.ForeColor = [System.Drawing.Color]::White
$keyBox.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$keyBox.Location = New-Object System.Drawing.Point(60,330)
$panel.Controls.Add($keyBox)

$status = Add-Text 'STATUS: CATNAP LOCK ACTIVE' 60 405 13 ([System.Drawing.Color]::Red)
Add-Text 'AWARENESS SIMULATION' 60 445 10 ([System.Drawing.Color]::DimGray) | Out-Null

$pictureBox = New-Object System.Windows.Forms.PictureBox
$pictureBox.Location = New-Object System.Drawing.Point(760,120)
$pictureBox.Size = New-Object System.Drawing.Size(560,374)
$pictureBox.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$pictureBox.BackColor = [System.Drawing.Color]::Black
$pictureBox.BorderStyle = [System.Windows.Forms.BorderStyle]::None

# Download the exact supplied image from this GitHub repository into TEMP.
$imagePath = Join-Path $env:TEMP 'catnap-image.jpg'
$imageUrl = 'https://raw.githubusercontent.com/kris1019/fake-ransomware-demo/main/images.jpg'

try {
    Invoke-WebRequest -UseBasicParsing -Uri $imageUrl -OutFile $imagePath -ErrorAction Stop
} catch {
    # Fallback for Windows machines whose Schannel certificate store is broken.
    & curl.exe -k -L -sS $imageUrl -o $imagePath
}

if (-not (Test-Path $imagePath)) {
    throw 'Could not download the Catnap image from GitHub.'
}

$stream = $null
$cat = [System.Drawing.Image]::FromFile($imagePath)
$pictureBox.Image = $cat
$panel.Controls.Add($pictureBox)

Add-Text '  /\\_/\\' 850 525 18 ([System.Drawing.Color]::Red) | Out-Null
Add-Text ' ( o.o )' 850 550 18 ([System.Drawing.Color]::Red) | Out-Null
Add-Text '  > ^ <' 850 575 18 ([System.Drawing.Color]::Red) | Out-Null

Add-Text 'THE CAT IS WATCHING.' 60 500 15 ([System.Drawing.Color]::DarkRed) | Out-Null
Add-Text 'YOUR DEADLINE IS RUNNING.' 60 535 15 ([System.Drawing.Color]::DarkRed) | Out-Null
Add-Text 'NO PURRS. NO MERCY.' 60 570 15 ([System.Drawing.Color]::DarkRed) | Out-Null

$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 1000
$timer.Tag = [pscustomobject]@{
    EndTime = [DateTime]::Now.AddHours(24)
    Label = $countdownLabel
}

$timer.Add_Tick({
    param($sender,$eventArgs)
    $state = $sender.Tag
    $remaining = $state.EndTime - [DateTime]::Now

    if ($remaining.TotalSeconds -le 0) {
        $state.Label.Text = '00:00:00'
        $sender.Stop()
        return
    }

    $hours = [math]::Floor($remaining.TotalHours)
    $minutes = $remaining.Minutes
    $seconds = $remaining.Seconds
    $state.Label.Text = '{0:00}:{1:00}:{2:00}' -f $hours,$minutes,$seconds
})

$keyBox.Add_KeyDown({
    param($sender,$eventArgs)
    if ($eventArgs.KeyCode -eq [System.Windows.Forms.Keys]::Enter) {
        $status.Text = 'RECOVERY KEY REJECTED'
        $sender.Clear()
        $eventArgs.SuppressKeyPress = $true
    }
})

$form.Add_KeyDown({
    param($sender,$eventArgs)
    if ($eventArgs.KeyCode -eq [System.Windows.Forms.Keys]::Escape) {
        $sender.Close()
    }
})

$timer.Start()
$form.Add_Shown({ $keyBox.Focus() })
[void]$form.ShowDialog()

$timer.Stop()
if ($pictureBox) { $pictureBox.Image = $null; $pictureBox.Dispose() }
if ($cat) { $cat.Dispose() }
if ($stream) { $stream.Dispose() }
$form.Dispose()
