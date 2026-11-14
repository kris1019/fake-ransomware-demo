Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Harmless ransomware-awareness simulation.
# No user files are read, encrypted, deleted, modified, or uploaded.

$form = New-Object System.Windows.Forms.Form
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::None
$form.WindowState = [System.Windows.Forms.FormWindowState]::Maximized
$form.BackColor = [System.Drawing.Color]::FromArgb(7,7,9)
$form.TopMost = $true
$form.KeyPreview = $true

$root = New-Object System.Windows.Forms.Panel
$root.Dock = [System.Windows.Forms.DockStyle]::Fill
$root.BackColor = [System.Drawing.Color]::FromArgb(7,7,9)
$form.Controls.Add($root)

function New-Label {
    param([string]$Text,[int]$Size,[System.Drawing.Color]$Color,[System.Drawing.ContentAlignment]$Align = [System.Drawing.ContentAlignment]::MiddleLeft)
    $label = New-Object System.Windows.Forms.Label
    $label.Text = $Text
    $label.ForeColor = $Color
    $label.BackColor = [System.Drawing.Color]::Transparent
    $label.Font = New-Object System.Drawing.Font('Consolas',$Size,[System.Drawing.FontStyle]::Bold)
    $label.AutoSize = $false
    $label.TextAlign = $Align
    return $label
}

# Header
$header = New-Object System.Windows.Forms.Panel
$header.Location = New-Object System.Drawing.Point(50,28)
$header.Size = New-Object System.Drawing.Size(1180,105)
$header.Anchor = 'Top,Left,Right'
$header.BackColor = [System.Drawing.Color]::FromArgb(14,14,17)
$header.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$root.Controls.Add($header)

$title = New-Label '!!! CATNAP HAS ENCRYPTED YOUR FILES !!!' 27 ([System.Drawing.Color]::FromArgb(235,45,45)) ([System.Drawing.ContentAlignment]::MiddleCenter)
$title.Location = New-Object System.Drawing.Point(20,8)
$title.Size = New-Object System.Drawing.Size(1140,48)
$header.Controls.Add($title)

$subtitle = New-Label 'CATNAP  //  FELINE ENCRYPTION SYSTEM' 13 ([System.Drawing.Color]::White) ([System.Drawing.ContentAlignment]::MiddleCenter)
$subtitle.Location = New-Object System.Drawing.Point(20,53)
$subtitle.Size = New-Object System.Drawing.Size(1140,24)
$header.Controls.Add($subtitle)

$subline = New-Label 'YOUR RECOVERY WINDOW IS RUNNING' 10 ([System.Drawing.Color]::FromArgb(145,145,150)) ([System.Drawing.ContentAlignment]::MiddleCenter)
$subline.Location = New-Object System.Drawing.Point(20,78)
$subline.Size = New-Object System.Drawing.Size(1140,20)
$header.Controls.Add($subline)

# Main content: image card + recovery card
$main = New-Object System.Windows.Forms.Panel
$main.Location = New-Object System.Drawing.Point(50,153)
$main.Size = New-Object System.Drawing.Size(1180,455)
$main.Anchor = 'Top,Left,Right'
$main.BackColor = [System.Drawing.Color]::Transparent
$root.Controls.Add($main)

# Image card
$imageCard = New-Object System.Windows.Forms.Panel
$imageCard.Location = New-Object System.Drawing.Point(0,0)
$imageCard.Size = New-Object System.Drawing.Size(690,455)
$imageCard.BackColor = [System.Drawing.Color]::FromArgb(14,14,17)
$imageCard.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$main.Controls.Add($imageCard)

$imageCaption = New-Label 'ENCRYPTED PREVIEW' 11 ([System.Drawing.Color]::FromArgb(150,150,155)) ([System.Drawing.ContentAlignment]::MiddleLeft)
$imageCaption.Location = New-Object System.Drawing.Point(24,15)
$imageCaption.Size = New-Object System.Drawing.Size(642,28)
$imageCard.Controls.Add($imageCaption)

$pictureBox = New-Object System.Windows.Forms.PictureBox
$pictureBox.Location = New-Object System.Drawing.Point(24,50)
$pictureBox.Size = New-Object System.Drawing.Size(642,350)
$pictureBox.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$pictureBox.BackColor = [System.Drawing.Color]::Black
$pictureBox.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$imageCard.Controls.Add($pictureBox)

$imageNote = New-Label 'CATNAP LOCK SCREEN // VISUAL PAYLOAD' 9 ([System.Drawing.Color]::FromArgb(105,105,110)) ([System.Drawing.ContentAlignment]::MiddleCenter)
$imageNote.Location = New-Object System.Drawing.Point(24,410)
$imageNote.Size = New-Object System.Drawing.Size(642,24)
$imageCard.Controls.Add($imageNote)

# Recovery card
$card = New-Object System.Windows.Forms.Panel
$card.Location = New-Object System.Drawing.Point(715,0)
$card.Size = New-Object System.Drawing.Size(465,455)
$card.BackColor = [System.Drawing.Color]::FromArgb(14,14,17)
$card.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$main.Controls.Add($card)

$cardTitle = New-Label 'RECOVERY CONSOLE' 17 ([System.Drawing.Color]::FromArgb(235,45,45))
$cardTitle.Location = New-Object System.Drawing.Point(28,22)
$cardTitle.Size = New-Object System.Drawing.Size(405,35)
$card.Controls.Add($cardTitle)

$line = New-Object System.Windows.Forms.Label
$line.Location = New-Object System.Drawing.Point(28,62)
$line.Size = New-Object System.Drawing.Size(405,1)
$line.BackColor = [System.Drawing.Color]::FromArgb(55,55,60)
$card.Controls.Add($line)

$instructions = New-Label ('ENTER YOUR RECOVERY KEY' + [Environment]::NewLine + 'TO RESTORE ACCESS:') 11 ([System.Drawing.Color]::White)
$instructions.Location = New-Object System.Drawing.Point(28,82)
$instructions.Size = New-Object System.Drawing.Size(405,52)
$card.Controls.Add($instructions)

$keyBox = New-Object System.Windows.Forms.TextBox
$keyBox.Location = New-Object System.Drawing.Point(28,143)
$keyBox.Size = New-Object System.Drawing.Size(405,52)
$keyBox.Font = New-Object System.Drawing.Font('Consolas',17)
$keyBox.BackColor = [System.Drawing.Color]::FromArgb(24,24,27)
$keyBox.ForeColor = [System.Drawing.Color]::White
$keyBox.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$card.Controls.Add($keyBox)

$status = New-Label 'STATUS: CATNAP LOCK ACTIVE' 10 ([System.Drawing.Color]::FromArgb(235,45,45))
$status.Location = New-Object System.Drawing.Point(28,213)
$status.Size = New-Object System.Drawing.Size(405,28)
$card.Controls.Add($status)

$timerCaption = New-Label 'TIME REMAINING' 10 ([System.Drawing.Color]::FromArgb(145,145,150))
$timerCaption.Location = New-Object System.Drawing.Point(28,257)
$timerCaption.Size = New-Object System.Drawing.Size(405,22)
$card.Controls.Add($timerCaption)

$countdownLabel = New-Label '24:00:00' 36 ([System.Drawing.Color]::FromArgb(235,45,45)) ([System.Drawing.ContentAlignment]::MiddleCenter)
$countdownLabel.Location = New-Object System.Drawing.Point(28,278)
$countdownLabel.Size = New-Object System.Drawing.Size(405,62)
$card.Controls.Add($countdownLabel)

$hint = New-Label 'ENTER = TEST KEY     ESC = EXIT' 9 ([System.Drawing.Color]::FromArgb(105,105,110)) ([System.Drawing.ContentAlignment]::MiddleCenter)
$hint.Location = New-Object System.Drawing.Point(28,370)
$hint.Size = New-Object System.Drawing.Size(405,25)
$card.Controls.Add($hint)

# Footer
$footer = New-Object System.Windows.Forms.Panel
$footer.Location = New-Object System.Drawing.Point(50,630)
$footer.Size = New-Object System.Drawing.Size(1180,70)
$footer.Anchor = 'Left,Right,Bottom'
$footer.BackColor = [System.Drawing.Color]::FromArgb(11,11,13)
$footer.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$root.Controls.Add($footer)

$notice = New-Label 'AWARENESS SIMULATION  •  NO FILES ARE ACTUALLY ENCRYPTED' 10 ([System.Drawing.Color]::FromArgb(155,155,160)) ([System.Drawing.ContentAlignment]::MiddleCenter)
$notice.Location = New-Object System.Drawing.Point(20,9)
$notice.Size = New-Object System.Drawing.Size(1140,24)
$footer.Controls.Add($notice)

$exit = New-Label 'ESC  •  EXIT SIMULATION' 9 ([System.Drawing.Color]::FromArgb(95,95,100)) ([System.Drawing.ContentAlignment]::MiddleCenter)
$exit.Location = New-Object System.Drawing.Point(20,36)
$exit.Size = New-Object System.Drawing.Size(1140,20)
$footer.Controls.Add($exit)

# Download exact repository image into TEMP
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

# 24-hour display timer
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
if ($pictureBox.Image) { $pictureBox.Image = $null; $pictureBox.Dispose() }
if ($cat) { $cat.Dispose() }
$form.Dispose()
