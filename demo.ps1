Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Harmless ransomware-awareness simulation.
# No user files are read, encrypted, deleted, modified, or uploaded.
# Escape exits the simulation.

[System.Windows.Forms.Application]::EnableVisualStyles()

$bg = [System.Drawing.Color]::FromArgb(8,9,12)
$panel = [System.Drawing.Color]::FromArgb(15,16,21)
$panel2 = [System.Drawing.Color]::FromArgb(20,21,27)
$line = [System.Drawing.Color]::FromArgb(45,47,55)
$red = [System.Drawing.Color]::FromArgb(235,55,55)
$redDark = [System.Drawing.Color]::FromArgb(105,24,28)
$white = [System.Drawing.Color]::FromArgb(242,242,245)
$muted = [System.Drawing.Color]::FromArgb(145,148,156)
$green = [System.Drawing.Color]::FromArgb(85,205,125)

$form = New-Object System.Windows.Forms.Form
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::None
$form.WindowState = [System.Windows.Forms.FormWindowState]::Maximized
$form.BackColor = $bg
$form.TopMost = $true
$form.KeyPreview = $true
$form.Text = 'CATNAP // LOCKOUT SIMULATION'

function New-Label {
    param(
        [string]$Text,
        [int]$Size,
        [System.Drawing.Color]$Color,
        [System.Drawing.ContentAlignment]$Align = [System.Drawing.ContentAlignment]::MiddleLeft
    )
    $l = New-Object System.Windows.Forms.Label
    $l.Text = $Text
    $l.ForeColor = $Color
    $l.BackColor = [System.Drawing.Color]::Transparent
    $l.Font = New-Object System.Drawing.Font('Segoe UI',$Size,[System.Drawing.FontStyle]::Bold)
    $l.TextAlign = $Align
    $l.AutoSize = $false
    return $l
}

function New-Panel {
    param([System.Drawing.Color]$Color)
    $p = New-Object System.Windows.Forms.Panel
    $p.BackColor = $Color
    $p.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
    return $p
}

$root = New-Object System.Windows.Forms.Panel
$root.Dock = [System.Windows.Forms.DockStyle]::Fill
$root.BackColor = $bg
$form.Controls.Add($root)

# Top warning strip
$strip = New-Object System.Windows.Forms.Panel
$strip.Location = New-Object System.Drawing.Point(0,0)
$strip.Size = New-Object System.Drawing.Size(1280,42)
$strip.BackColor = $redDark
$strip.Anchor = 'Top,Left,Right'
$root.Controls.Add($strip)

$stripText = New-Label 'CATNAP SECURITY EVENT  //  ACCESS TO THIS COMPUTER HAS BEEN LOCKED' 10 $white ([System.Drawing.ContentAlignment]::MiddleCenter)
$stripText.Location = New-Object System.Drawing.Point(20,0)
$stripText.Size = New-Object System.Drawing.Size(1240,42)
$strip.Controls.Add($stripText)

# Header
$header = New-Panel $panel
$header.Location = New-Object System.Drawing.Point(40,62)
$header.Size = New-Object System.Drawing.Size(1200,105)
$header.Anchor = 'Top,Left,Right'
$root.Controls.Add($header)

$lock = New-Label 'LOCKED' 11 $red ([System.Drawing.ContentAlignment]::MiddleLeft)
$lock.Location = New-Object System.Drawing.Point(25,13)
$lock.Size = New-Object System.Drawing.Size(110,24)
$header.Controls.Add($lock)

$title = New-Label 'YOUR FILES HAVE BEEN ENCRYPTED' 27 $white ([System.Drawing.ContentAlignment]::MiddleLeft)
$title.Location = New-Object System.Drawing.Point(23,34)
$title.Size = New-Object System.Drawing.Size(760,52)
$header.Controls.Add($title)

$node = New-Label 'CATNAP  /  FELINE ENCRYPTION SYSTEM' 10 $muted ([System.Drawing.ContentAlignment]::MiddleRight)
$node.Location = New-Object System.Drawing.Point(800,22)
$node.Size = New-Object System.Drawing.Size(370,25)
$header.Controls.Add($node)

$event = New-Label 'EVENT ID  CN-7F42-LOCK  •  SIMULATION MODE' 9 $muted ([System.Drawing.ContentAlignment]::MiddleRight)
$event.Location = New-Object System.Drawing.Point(760,54)
$event.Size = New-Object System.Drawing.Size(410,22)
$header.Controls.Add($event)

# Main left card
$left = New-Panel $panel
$left.Location = New-Object System.Drawing.Point(40,184)
$left.Size = New-Object System.Drawing.Size(745,420)
$left.Anchor = 'Top,Left'
$root.Controls.Add($left)

$previewTitle = New-Label 'ENCRYPTION PREVIEW' 11 $white
$previewTitle.Location = New-Object System.Drawing.Point(24,15)
$previewTitle.Size = New-Object System.Drawing.Size(300,28)
$left.Controls.Add($previewTitle)

$previewStatus = New-Label 'SIMULATED DATA TRANSFORMATION' 9 $red ([System.Drawing.ContentAlignment]::MiddleRight)
$previewStatus.Location = New-Object System.Drawing.Point(385,15)
$previewStatus.Size = New-Object System.Drawing.Size(330,28)
$left.Controls.Add($previewStatus)

$imageFrame = New-Panel ([System.Drawing.Color]::FromArgb(3,4,6))
$imageFrame.Location = New-Object System.Drawing.Point(24,55)
$imageFrame.Size = New-Object System.Drawing.Size(697,250)
$left.Controls.Add($imageFrame)

$pictureBox = New-Object System.Windows.Forms.PictureBox
$pictureBox.Location = New-Object System.Drawing.Point(5,5)
$pictureBox.Size = New-Object System.Drawing.Size(687,240)
$pictureBox.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$pictureBox.BackColor = [System.Drawing.Color]::Black
$imageFrame.Controls.Add($pictureBox)

$progressTitle = New-Label 'ENCRYPTION ENGINE' 9 $muted
$progressTitle.Location = New-Object System.Drawing.Point(24,322)
$progressTitle.Size = New-Object System.Drawing.Size(180,22)
$left.Controls.Add($progressTitle)

$progressValue = New-Label '37%' 10 $white ([System.Drawing.ContentAlignment]::MiddleRight)
$progressValue.Location = New-Object System.Drawing.Point(600,322)
$progressValue.Size = New-Object System.Drawing.Size(121,22)
$left.Controls.Add($progressValue)

$progressBack = New-Object System.Windows.Forms.Panel
$progressBack.Location = New-Object System.Drawing.Point(24,349)
$progressBack.Size = New-Object System.Drawing.Size(697,10)
$progressBack.BackColor = [System.Drawing.Color]::FromArgb(35,36,42)
$left.Controls.Add($progressBack)

$progressFill = New-Object System.Windows.Forms.Panel
$progressFill.Location = New-Object System.Drawing.Point(0,0)
$progressFill.Size = New-Object System.Drawing.Size(258,10)
$progressFill.BackColor = $red
$progressBack.Controls.Add($progressFill)

$fileLabel = New-Label 'PROCESSING  //  photo_archive_07.dat' 9 $muted
$fileLabel.Location = New-Object System.Drawing.Point(24,370)
$fileLabel.Size = New-Object System.Drawing.Size(697,28)
$left.Controls.Add($fileLabel)

# Right recovery card
$right = New-Panel $panel
$right.Location = New-Object System.Drawing.Point(805,184)
$right.Size = New-Object System.Drawing.Size(435,420)
$right.Anchor = 'Top,Right'
$root.Controls.Add($right)

$rightTitle = New-Label 'RECOVERY CONSOLE' 18 $white
$rightTitle.Location = New-Object System.Drawing.Point(25,18)
$rightTitle.Size = New-Object System.Drawing.Size(385,36)
$right.Controls.Add($rightTitle)

$rightSub = New-Label 'PAYMENT / KEY VERIFICATION REQUIRED' 9 $red
$rightSub.Location = New-Object System.Drawing.Point(25,54)
$rightSub.Size = New-Object System.Drawing.Size(385,22)
$right.Controls.Add($rightSub)

$rule = New-Object System.Windows.Forms.Panel
$rule.Location = New-Object System.Drawing.Point(25,84)
$rule.Size = New-Object System.Drawing.Size(385,1)
$rule.BackColor = $line
$right.Controls.Add($rule)

$keyCaption = New-Label 'ENTER RECOVERY KEY' 10 $muted
$keyCaption.Location = New-Object System.Drawing.Point(25,104)
$keyCaption.Size = New-Object System.Drawing.Size(385,24)
$right.Controls.Add($keyCaption)

$keyBox = New-Object System.Windows.Forms.TextBox
$keyBox.Location = New-Object System.Drawing.Point(25,134)
$keyBox.Size = New-Object System.Drawing.Size(385,50)
$keyBox.Font = New-Object System.Drawing.Font('Consolas',16,[System.Drawing.FontStyle]::Regular)
$keyBox.BackColor = [System.Drawing.Color]::FromArgb(8,9,12)
$keyBox.ForeColor = $white
$keyBox.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$keyBox.TextAlign = [System.Windows.Forms.HorizontalAlignment]::Center
$right.Controls.Add($keyBox)

$verify = New-Object System.Windows.Forms.Button
$verify.Text = 'VERIFY KEY'
$verify.Location = New-Object System.Drawing.Point(25,195)
$verify.Size = New-Object System.Drawing.Size(385,42)
$verify.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$verify.FlatAppearance.BorderColor = $red
$verify.FlatAppearance.BorderSize = 1
$verify.BackColor = [System.Drawing.Color]::FromArgb(65,18,21)
$verify.ForeColor = $white
$verify.Font = New-Object System.Drawing.Font('Segoe UI',10,[System.Drawing.FontStyle]::Bold)
$right.Controls.Add($verify)

$status = New-Label '●  LOCK ACTIVE  /  KEY NOT VERIFIED' 9 $red
$status.Location = New-Object System.Drawing.Point(25,252)
$status.Size = New-Object System.Drawing.Size(385,24)
$right.Controls.Add($status)

$timeCaption = New-Label 'TIME REMAINING' 9 $muted ([System.Drawing.ContentAlignment]::MiddleCenter)
$timeCaption.Location = New-Object System.Drawing.Point(25,288)
$timeCaption.Size = New-Object System.Drawing.Size(385,22)
$right.Controls.Add($timeCaption)

$countdownLabel = New-Label '24:00:00' 31 $white ([System.Drawing.ContentAlignment]::MiddleCenter)
$countdownLabel.Location = New-Object System.Drawing.Point(25,309)
$countdownLabel.Size = New-Object System.Drawing.Size(385,58)
$right.Controls.Add($countdownLabel)

$hint = New-Label 'ENTER = VERIFY KEY    •    ESC = EXIT SIMULATION' 8 $muted ([System.Drawing.ContentAlignment]::MiddleCenter)
$hint.Location = New-Object System.Drawing.Point(25,377)
$hint.Size = New-Object System.Drawing.Size(385,25)
$right.Controls.Add($hint)

# Bottom disclosure bar
$footer = New-Panel ([System.Drawing.Color]::FromArgb(12,13,16))
$footer.Location = New-Object System.Drawing.Point(40,622)
$footer.Size = New-Object System.Drawing.Size(1200,65)
$footer.Anchor = 'Left,Right,Bottom'
$root.Controls.Add($footer)

$notice = New-Label 'AWARENESS SIMULATION  •  NO FILES ARE ACTUALLY ENCRYPTED OR MODIFIED' 10 $green
$notice.Location = New-Object System.Drawing.Point(20,8)
$notice.Size = New-Object System.Drawing.Size(760,24)
$footer.Controls.Add($notice)

$footerText = New-Label 'This screen is a visual security demonstration.' 9 $muted
$footerText.Location = New-Object System.Drawing.Point(20,32)
$footerText.Size = New-Object System.Drawing.Size(760,20)
$footer.Controls.Add($footerText)

$exitText = New-Label 'ESC  •  EXIT' 10 $muted ([System.Drawing.ContentAlignment]::MiddleRight)
$exitText.Location = New-Object System.Drawing.Point(930,17)
$exitText.Size = New-Object System.Drawing.Size(240,30)
$footer.Controls.Add($exitText)

# Exact repository image -> TEMP
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

# Fake activity animation. It only changes on-screen text.
$fileNames = @(
    'photo_archive_07.dat',
    'documents_backup_12.bin',
    'family_photos_03.dat',
    'project_files_19.bin',
    'desktop_archive_02.dat'
)
$fakeProgress = 37
$fileIndex = 0

$uiTimer = New-Object System.Windows.Forms.Timer
$uiTimer.Interval = 900
$uiTimer.Tag = [pscustomobject]@{
    EndTime = [DateTime]::Now.AddHours(24)
    Countdown = $countdownLabel
    Progress = $progressValue
    Fill = $progressFill
    File = $fileLabel
    Names = $fileNames
    Index = 0
    Percent = 37
}
$uiTimer.Add_Tick({
    param($sender,$eventArgs)
    $s = $sender.Tag

    $remaining = $s.EndTime - [DateTime]::Now
    if ($remaining.TotalSeconds -le 0) {
        $s.Countdown.Text = '00:00:00'
        return
    }

    $hours = [math]::Floor($remaining.TotalHours)
    $s.Countdown.Text = '{0:00}:{1:00}:{2:00}' -f $hours,$remaining.Minutes,$remaining.Seconds

    $s.Index = ($s.Index + 1) % $s.Names.Count
    $s.File.Text = 'PROCESSING  //  ' + $s.Names[$s.Index]

    $s.Percent = $s.Percent + 1
    if ($s.Percent -gt 64) { $s.Percent = 37 }
    $s.Progress.Text = '{0}%' -f $s.Percent
    $s.Fill.Width = [math]::Max(1,[math]::Floor(6.97 * $s.Percent))
})

$verifyAction = {
    $status.Text = '●  RECOVERY KEY REJECTED  /  TRY AGAIN'
    $status.ForeColor = $red
    $keyBox.Clear()
    $keyBox.Focus()
}

$verify.Add_Click($verifyAction)
$keyBox.Add_KeyDown({
    param($sender,$eventArgs)
    if ($eventArgs.KeyCode -eq [System.Windows.Forms.Keys]::Enter) {
        & $verifyAction
        $eventArgs.SuppressKeyPress = $true
    }
})

$form.Add_KeyDown({
    param($sender,$eventArgs)
    if ($eventArgs.KeyCode -eq [System.Windows.Forms.Keys]::Escape) {
        $sender.Close()
    }
})

$uiTimer.Start()
$form.Add_Shown({ $keyBox.Focus() })
[void]$form.ShowDialog()

$uiTimer.Stop()
if ($pictureBox.Image) {
    $pictureBox.Image = $null
    $cat.Dispose()
}
$pictureBox.Dispose()
$form.Dispose()
