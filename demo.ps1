Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
[System.Windows.Forms.Application]::EnableVisualStyles()

# DISPLAY-ONLY AWARENESS SIMULATION.
# No files are read, encrypted, deleted, modified, or uploaded.
# ESC closes the simulation.

$form = New-Object Windows.Forms.Form
$form.FormBorderStyle = 'None'
$form.WindowState = 'Maximized'
$form.BackColor = [Drawing.Color]::FromArgb(7,7,9)
$form.TopMost = $true
$form.KeyPreview = $true
$form.Text = 'CATNAP // LOCKOUT'

function New-Label($text,$size,$color,$align='MiddleLeft') {
    $x = New-Object Windows.Forms.Label
    $x.Text = $text
    $x.Font = New-Object Drawing.Font('Segoe UI',$size,[Drawing.FontStyle]::Bold)
    $x.ForeColor = $color
    $x.BackColor = [Drawing.Color]::Transparent
    $x.TextAlign = $align
    $x.AutoSize = $false
    return $x
}
function New-Panel($color) {
    $p = New-Object Windows.Forms.Panel
    $p.BackColor = $color
    return $p
}

$root = New-Panel ([Drawing.Color]::FromArgb(7,7,9))
$root.Dock = 'Fill'
$form.Controls.Add($root)

$alarm = New-Panel ([Drawing.Color]::FromArgb(170,20,25))
$alarm.Dock = 'Top'
$alarm.Height = 58
$root.Controls.Add($alarm)

$a = New-Label '!! CRITICAL SECURITY EVENT // COMPUTER LOCKED !!' 13 ([Drawing.Color]::White) 'MiddleCenter'
$a.Dock = 'Fill'
$alarm.Controls.Add($a)

$frame = New-Panel ([Drawing.Color]::FromArgb(16,16,20))
$frame.Location = New-Object Drawing.Point(32,82)
$frame.Size = New-Object Drawing.Size(1216,610)
$root.Controls.Add($frame)

$left = New-Panel ([Drawing.Color]::FromArgb(10,10,13))
$left.Location = New-Object Drawing.Point(18,18)
$left.Size = New-Object Drawing.Size(720,574)
$frame.Controls.Add($left)

$brand = New-Label 'CATNAP // LOCKOUT' 14 ([Drawing.Color]::FromArgb(235,55,55))
$brand.Location = New-Object Drawing.Point(25,18)
$brand.Size = New-Object Drawing.Size(650,30)
$left.Controls.Add($brand)

$t = New-Label 'YOUR FILES HAVE BEEN' 25 ([Drawing.Color]::White)
$t.Location = New-Object Drawing.Point(25,58)
$t.Size = New-Object Drawing.Size(650,45)
$left.Controls.Add($t)

$t2 = New-Label 'BEEN ENCRYPTED' 25 ([Drawing.Color]::FromArgb(235,55,55))
$t2.Location = New-Object Drawing.Point(25,101)
$t2.Size = New-Object Drawing.Size(650,45)
$left.Controls.Add($t2)

$d = New-Label 'A private encryption key is required to restore access.' 11 ([Drawing.Color]::FromArgb(175,175,182))
$d.Location = New-Object Drawing.Point(27,151)
$d.Size = New-Object Drawing.Size(650,30)
$left.Controls.Add($d)

$stats = New-Panel ([Drawing.Color]::FromArgb(18,18,22))
$stats.Location = New-Object Drawing.Point(25,198)
$stats.Size = New-Object Drawing.Size(650,92)
$left.Controls.Add($stats)

$items = @(
    @('ENCRYPTION','AES-256 / CATNAP',18),
    @('FILES LOCKED','1,284',230),
    @('STATUS','LOCKED',450)
)
foreach($q in $items) {
    $z = New-Label $q[0] 8 ([Drawing.Color]::FromArgb(130,130,138))
    $z.Location = New-Object Drawing.Point($q[2],10)
    $z.Size = New-Object Drawing.Size(180,20)
    $stats.Controls.Add($z)
    $vcolor = if($q[0] -eq 'STATUS'){[Drawing.Color]::FromArgb(235,55,55)}else{[Drawing.Color]::White}
    $v = New-Label $q[1] 12 $vcolor
    $v.Location = New-Object Drawing.Point($q[2],32)
    $v.Size = New-Object Drawing.Size(180,28)
    $stats.Controls.Add($v)
}

$right = New-Panel ([Drawing.Color]::FromArgb(24,15,17))
$right.Location = New-Object Drawing.Point(755,18)
$right.Size = New-Object Drawing.Size(443,574)
$frame.Controls.Add($right)

$rt = New-Label 'LOCKOUT CONSOLE' 20 ([Drawing.Color]::White) 'MiddleCenter'
$rt.Location = New-Object Drawing.Point(20,20)
$rt.Size = New-Object Drawing.Size(403,40)
$right.Controls.Add($rt)

$rule = New-Panel ([Drawing.Color]::FromArgb(90,35,40))
$rule.Location = New-Object Drawing.Point(35,70)
$rule.Size = New-Object Drawing.Size(373,2)
$right.Controls.Add($rule)

$cc = New-Label 'DEADLINE' 8 ([Drawing.Color]::FromArgb(165,165,172)) 'MiddleCenter'
$cc.Location = New-Object Drawing.Point(35,91)
$cc.Size = New-Object Drawing.Size(373,22)
$right.Controls.Add($cc)

$count = New-Label '24:00:00' 37 ([Drawing.Color]::FromArgb(245,70,70)) 'MiddleCenter'
$count.Location = New-Object Drawing.Point(25,112)
$count.Size = New-Object Drawing.Size(393,65)
$right.Controls.Add($count)

$dl = New-Label 'TIME REMAINING' 9 ([Drawing.Color]::FromArgb(140,140,148)) 'MiddleCenter'
$dl.Location = New-Object Drawing.Point(35,178)
$dl.Size = New-Object Drawing.Size(373,24)
$right.Controls.Add($dl)

$kc = New-Label 'RECOVERY KEY' 9 ([Drawing.Color]::White)
$kc.Location = New-Object Drawing.Point(35,222)
$kc.Size = New-Object Drawing.Size(373,24)
$right.Controls.Add($kc)

$key = New-Object Windows.Forms.TextBox
$key.Location = New-Object Drawing.Point(35,251)
$key.Size = New-Object Drawing.Size(373,48)
$key.Font = New-Object Drawing.Font('Consolas',15)
$key.BackColor = [Drawing.Color]::FromArgb(8,8,10)
$key.ForeColor = [Drawing.Color]::White
$key.BorderStyle = 'FixedSingle'
$key.TextAlign = 'Center'
$right.Controls.Add($key)

$button = New-Object Windows.Forms.Button
$button.Text = 'UNLOCK / VERIFY KEY'
$button.Location = New-Object Drawing.Point(35,309)
$button.Size = New-Object Drawing.Size(373,45)
$button.FlatStyle = 'Flat'
$button.FlatAppearance.BorderSize = 1
$button.FlatAppearance.BorderColor = [Drawing.Color]::FromArgb(235,55,55)
$button.BackColor = [Drawing.Color]::FromArgb(100,24,29)
$button.ForeColor = [Drawing.Color]::White
$button.Font = New-Object Drawing.Font('Segoe UI',10,[Drawing.FontStyle]::Bold)
$right.Controls.Add($button)

$status = New-Label '*  LOCK ACTIVE  //  AWAITING KEY' 9 ([Drawing.Color]::FromArgb(235,55,55)) 'MiddleCenter'
$status.Location = New-Object Drawing.Point(35,367)
$status.Size = New-Object Drawing.Size(373,27)
$right.Controls.Add($status)

$info = New-Label 'SYSTEM ID  CN-7F42-LOCK   |   SESSION  SIM-2026-11   |   MODE  AWARENESS DEMO' 8 ([Drawing.Color]::FromArgb(135,135,142)) 'MiddleCenter'
$info.Location = New-Object Drawing.Point(35,414)
$info.Size = New-Object Drawing.Size(373,55)
$right.Controls.Add($info)

$esc = New-Label 'ESC  ->  EXIT SIMULATION' 9 ([Drawing.Color]::FromArgb(165,165,172)) 'MiddleCenter'
$esc.Location = New-Object Drawing.Point(35,510)
$esc.Size = New-Object Drawing.Size(373,28)
$right.Controls.Add($esc)

$foot = New-Label 'AWARENESS SIMULATION  *  NO FILES ARE ACTUALLY ENCRYPTED OR MODIFIED' 9 ([Drawing.Color]::FromArgb(80,210,125)) 'MiddleCenter'
$foot.Dock = 'Bottom'
$foot.Height = 35
$root.Controls.Add($foot)

$end = [DateTime]::Now.AddHours(24)
$timer = New-Object Windows.Forms.Timer
$timer.Interval = 1000
$timer.Tag = [pscustomobject]@{End=$end;Label=$count}
$timer.Add_Tick({
    $s = $_.Sender.Tag
    $r = $s.End - [DateTime]::Now
    if($r.TotalSeconds -le 0) {
        $s.Label.Text = '00:00:00'
        $_.Sender.Stop()
        return
    }
    $s.Label.Text = '{0:00}:{1:00}:{2:00}' -f [math]::Floor($r.TotalHours),$r.Minutes,$r.Seconds
})

$verify = {
    $status.Text = '*  KEY REJECTED  //  ACCESS REMAINS LOCKED'
    $key.Clear()
    $key.Focus()
}
$button.Add_Click($verify)
$key.Add_KeyDown({
    param($s,$e)
    if($e.KeyCode -eq 'Enter') {
        & $verify
        $e.SuppressKeyPress = $true
    }
})
$form.Add_KeyDown({
    param($s,$e)
    if($e.KeyCode -eq 'Escape') { $s.Close() }
})

$timer.Start()
$form.Add_Shown({$key.Focus()})
[void]$form.ShowDialog()
$timer.Stop()
if($pictureBox.Image){$pictureBox.Image.Dispose()}
$form.Dispose()
