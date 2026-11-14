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
$panel.BackColor = [System.Drawing.Color]::FromArgb(8,8,8)
$form.Controls.Add($panel)

function New-Label {
    param([string]$Text,[int]$X,[int]$Y,[int]$Size,[System.Drawing.Color]$Color)
    $label = New-Object System.Windows.Forms.Label
    $label.Text = $Text
    $label.ForeColor = $Color
    $label.BackColor = [System.Drawing.Color]::Transparent
    $label.Font = New-Object System.Drawing.Font('Consolas',$Size,[System.Drawing.FontStyle]::Bold)
    $label.AutoSize = $true
    $label.Location = New-Object System.Drawing.Point($X,$Y)
    $panel.Controls.Add($label)
    return $label
}

New-Label '!!! CATNAP HAS ENCRYPTED YOUR FILES !!!' 60 35 24 ([System.Drawing.Color]::Red) | Out-Null
New-Label 'CATNAP // FELINE ENCRYPTION SYSTEM' 64 82 12 ([System.Drawing.Color]::White) | Out-Null
New-Label 'YOUR RECOVERY WINDOW IS RUNNING' 64 110 11 ([System.Drawing.Color]::Gray) | Out-Null

$pictureBox = New-Object System.Windows.Forms.PictureBox
$pictureBox.Location = New-Object System.Drawing.Point(60,155)
$pictureBox.Size = New-Object System.Drawing.Size(620,414)
$pictureBox.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$pictureBox.BackColor = [System.Drawing.Color]::Black
$pictureBox.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$panel.Controls.Add($pictureBox)

$side = New-Object System.Windows.Forms.Panel
$side.Location = New-Object System.Drawing.Point(720,155)
$side.Size = New-Object System.Drawing.Size(520,414)
$side.BackColor = [System.Drawing.Color]::FromArgb(16,16,16)
$side.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$panel.Controls.Add($side)

$sideTitle = New-Object System.Windows.Forms.Label
$sideTitle.Text = 'RECOVERY CONSOLE'
$sideTitle.ForeColor = [System.Drawing.Color]::Red
$sideTitle.Font = New-Object System.Drawing.Font('Consolas',16,[System.Drawing.FontStyle]::Bold)
$sideTitle.AutoSize = $true
$sideTitle.Location = New-Object System.Drawing.Point(28,25)
$side.Controls.Add($sideTitle)

$sideText = New-Object System.Windows.Forms.Label
$sideText.Text = 'ENTER YOUR RECOVERY KEY' + [Environment]::NewLine + 'TO RESTORE ACCESS:'
$sideText.ForeColor = [System.Drawing.Color]::White
$sideText.Font = New-Object System.Drawing.Font('Consolas',11,[System.Drawing.FontStyle]::Bold)
$sideText.AutoSize = $true
$sideText.Location = New-Object System.Drawing.Point(28,70)
$side.Controls.Add($sideText)

$keyBox = New-Object System.Windows.Forms.TextBox
$keyBox.Size = New-Object System.Drawing.Size(460,52)
$keyBox.Font = New-Object System.Drawing.Font('Consolas',18)
$keyBox.BackColor = [System.Drawing.Color]::FromArgb(24,24,24)
$keyBox.ForeColor = [System.Drawing.Color]::White
$keyBox.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$keyBox.Location = New-Object System.Drawing.Point(28,145)
$side.Controls.Add($keyBox)

$status = New-Object System.Windows.Forms.Label
$status.Text = 'STATUS: CATNAP LOCK ACTIVE'
$status.ForeColor = [System.Drawing.Color]::Red
$status.Font = New-Object System.Drawing.Font('Consolas',11,[System.Drawing.FontStyle]::Bold)
$status.AutoSize = $true
$status.Location = New-Object System.Drawing.Point(28,225)
$side.Controls.Add($status)

$timerCaption = New-Object System.Windows.Forms.Label
$timerCaption.Text = 'TIME REMAINING'
$timerCaption.ForeColor = [System.Drawing.Color]::Gray
$timerCaption.Font = New-Object System.Drawing.Font('Consolas',10,[System.Drawing.FontStyle]::Bold)
$timerCaption.AutoSize = $true
$timerCaption.Location = New-Object System.Drawing.Point(28,270)
$side.Controls.Add($timerCaption)

$countdownLabel = New-Object System.Windows.Forms.Label
$countdownLabel.Text = '24:00:00'
$countdownLabel.ForeColor = [System.Drawing.Color]::Red
$countdownLabel.Font = New-Object System.Drawing.Font('Consolas',34,[System.Drawing.FontStyle]::Bold)
$countdownLabel.AutoSize = $true
$countdownLabel.Location = New-Object System.Drawing.Point(24,300)
$side.Controls.Add($countdownLabel)

New-Label 'AWARENESS SIMULATION  •  NO FILES ARE ACTUALLY ENCRYPTED' 60 600 10 ([System.Drawing.Color]::DimGray) | Out-Null
New-Label 'ESC  •  EXIT SIMULATION' 60 625 10 ([System.Drawing.Color]::DimGray) | Out-Null

$imagePath = Join-Path $env:TEMP 'catnap-image.jpg'
$imageUrl = 'https://raw.githubusercontent.com/kris1019/fake-ransomware-demo/main/images.jpg'
try {
    Invoke-WebRequest -UseBasicParsing -Uri $imageUrl -OutFile $imagePath -ErrorAction Stop
} catch {
    & curl.exe -k -L -sS $imageUrl -o $imagePath
}
if (-not (Test-Path $imagePath)) { throw 'Could not download the Catnap image from GitHub.' }
$cat = [System.Drawing.Image]::FromFile($imagePath)
$pictureBox.Image = $cat

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
