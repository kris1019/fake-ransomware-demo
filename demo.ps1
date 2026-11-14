Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Harmless ransomware-awareness simulation. No files are read, changed, encrypted, deleted, or uploaded.
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

$title = Add-Text '!!! YOUR FILES HAVE BEEN ENCRYPTED !!!' 70 55 30 ([System.Drawing.Color]::Red)
$warning = Add-Text 'THIS IS A SIMULATION - NO FILES WERE TOUCHED' 75 115 16 ([System.Drawing.Color]::White)
$line2 = Add-Text 'Your recovery window is running.' 75 150 15 ([System.Drawing.Color]::White)
$caption = Add-Text 'TIME REMAINING' 80 205 12 ([System.Drawing.Color]::Gray)
$timerLabel = Add-Text '24:00:00' 75 225 34 ([System.Drawing.Color]::Red)
$keyCaption = Add-Text 'ENTER RECOVERY KEY' 75 315 14 ([System.Drawing.Color]::White)

$keyBox = New-Object System.Windows.Forms.TextBox
$keyBox.Size = New-Object System.Drawing.Size(560,48)
$keyBox.Font = New-Object System.Drawing.Font('Consolas',18)
$keyBox.BackColor = [System.Drawing.Color]::FromArgb(20,20,20)
$keyBox.ForeColor = [System.Drawing.Color]::White
$keyBox.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$keyBox.Location = New-Object System.Drawing.Point(75,350)
$panel.Controls.Add($keyBox)

$status = Add-Text 'STATUS: FILE RECOVERY LOCKED' 75 420 13 ([System.Drawing.Color]::Red)
$clown = Add-Text '        .--------.' 760 190 18 ([System.Drawing.Color]::Red)
$clown2 = Add-Text '      .  O    O  .' 760 220 16 ([System.Drawing.Color]::Red)
$clown3 = Add-Text '     /      __      \' 760 250 16 ([System.Drawing.Color]::Red)
$clown4 = Add-Text '    |    .------.    |' 760 280 16 ([System.Drawing.Color]::Red)
$clown5 = Add-Text '     \   \______/   /' 760 310 16 ([System.Drawing.Color]::Red)
$clown6 = Add-Text '      .__________.' 760 340 16 ([System.Drawing.Color]::Red)
$scary = Add-Text 'THERE IS NO WAY BACK.' 760 420 15 ([System.Drawing.Color]::DarkRed)
$scary2 = Add-Text 'YOUR DEADLINE IS RUNNING.' 760 455 15 ([System.Drawing.Color]::DarkRed)
$scary3 = Add-Text 'EVERY SECOND COUNTS.' 760 490 15 ([System.Drawing.Color]::DarkRed)

$remaining = 86400
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 1000
$timer.Add_Tick({
    if ($remaining -gt 0) { $remaining-- }
    $h = [math]::Floor($remaining / 3600)
    $m = [math]::Floor(($remaining % 3600) / 60)
    $s = $remaining % 60
    $timerLabel.Text = '{0:00}:{1:00}:{2:00}' -f $h,$m,$s
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
    if ($_.KeyCode -eq [System.Windows.Forms.Keys]::Escape) { $form.Close() }
})

$timer.Start()
$form.Add_Shown({ $keyBox.Focus() })
[void]$form.ShowDialog()
$timer.Stop()
$form.Dispose()