Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Harmless ransomware-awareness simulation. No user files are read, encrypted,
# deleted, modified, or uploaded.
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

$title = Add-Text '!!! CATNAP HAS ENCRYPTED YOUR FILES !!!' 55 45 28 ([System.Drawing.Color]::Red)
$warning = Add-Text 'CATNAP // FELINE ENCRYPTION SYSTEM' 60 100 15 ([System.Drawing.Color]::White)
$line2 = Add-Text 'Your recovery window is running.' 60 135 14 ([System.Drawing.Color]::White)

$caption = Add-Text 'CATNAP COUNTDOWN' 65 190 12 ([System.Drawing.Color]::Gray)
$timerLabel = Add-Text '24:00:00' 60 210 34 ([System.Drawing.Color]::Red)

$keyCaption = Add-Text 'ENTER CATNAP RECOVERY KEY' 60 295 14 ([System.Drawing.Color]::White)
$keyBox = New-Object System.Windows.Forms.TextBox
$keyBox.Size = New-Object System.Drawing.Size(570,48)
$keyBox.Font = New-Object System.Drawing.Font('Consolas',18)
$keyBox.BackColor = [System.Drawing.Color]::FromArgb(20,20,20)
$keyBox.ForeColor = [System.Drawing.Color]::White
$keyBox.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$keyBox.Location = New-Object System.Drawing.Point(60,330)
$panel.Controls.Add($keyBox)

$status = Add-Text 'STATUS: CATNAP LOCK ACTIVE' 60 405 13 ([System.Drawing.Color]::Red)
$notice = Add-Text 'AWARENESS SIMULATION' 60 445 10 ([System.Drawing.Color]::DimGray)

$imageUrl = 'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187.jpg?w=718&h=479'
$pictureBox = $null
$picture = $null
$ms = $null
$wc = $null

try {
    $wc = New-Object System.Net.WebClient
    $bytes = $wc.DownloadData($imageUrl)
    $ms = New-Object System.IO.MemoryStream(,$bytes)
    $picture = [System.Drawing.Image]::FromStream($ms)
    $pictureBox = New-Object System.Windows.Forms.PictureBox
    $pictureBox.Location = New-Object System.Drawing.Point(760,120)
    $pictureBox.Size = New-Object System.Drawing.Size(560,374)
    $pictureBox.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
    $pictureBox.BackColor = [System.Drawing.Color]::Black
    $pictureBox.Image = $picture
    $panel.Controls.Add($pictureBox)
} catch {
    Add-Text '[CAT IMAGE UNAVAILABLE]' 850 280 15 ([System.Drawing.Color]::DarkRed)
}

Add-Text '        /\\_/\\' 850 525 18 ([System.Drawing.Color]::Red)
Add-Text '       ( o.o )' 850 550 18 ([System.Drawing.Color]::Red)
Add-Text '        > ^ <' 850 575 18 ([System.Drawing.Color]::Red)

$scary = Add-Text 'THE CAT IS WATCHING.' 60 500 15 ([System.Drawing.Color]::DarkRed)
$scary2 = Add-Text 'YOUR DEADLINE IS RUNNING.' 60 535 15 ([System.Drawing.Color]::DarkRed)
$scary3 = Add-Text 'NO PURRS. NO MERCY.' 60 570 15 ([System.Drawing.Color]::DarkRed)

# Countdown: use script scope so the event handler updates the same value
# on every tick instead of resetting to 23:59:59 each second.
$script:remaining = 86400
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 1000

$timer.Add_Tick({
    if ($script:remaining -gt 0) {
        $script:remaining--
        $h = [math]::Floor($script:remaining / 3600)
        $m = [math]::Floor(($script:remaining % 3600) / 60)
        $s = $script:remaining % 60
        $timerLabel.Text = '{0:00}:{1:00}:{2:00}' -f $h,$m,$s
    }

    if ((Get-Random -Minimum 0 -Maximum 2) -eq 0) {
        $title.ForeColor = [System.Drawing.Color]::Red
        $scary.ForeColor = [System.Drawing.Color]::Red
    } else {
        $title.ForeColor = [System.Drawing.Color]::White
        $scary.ForeColor = [System.Drawing.Color]::DarkRed
    }
})

$keyBox.Add_KeyDown({
    if ($_.KeyCode -eq [System.Windows.Forms.Keys]::Enter) {
        $status.Text = 'RECOVERY KEY REJECTED'
        $keyBox.Clear()
    }
})

$form.Add_KeyDown({
    if ($_.KeyCode -eq [System.Windows.Forms.Keys]::Escape) {
        $form.Close()
    }
})

$timer.Start()
$form.Add_Shown({ $keyBox.Focus() })
[void]$form.ShowDialog()

$timer.Stop()
if ($pictureBox) { $pictureBox.Image = $null; $pictureBox.Dispose() }
if ($picture) { $picture.Dispose() }
if ($ms) { $ms.Dispose() }
if ($wc) { $wc.Dispose() }
$form.Dispose()
