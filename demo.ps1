Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
# Harmless visual prank. No files are read, encrypted, deleted, uploaded, or modified.
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
function Add-Text($text,$x,$y,$size,$color) {
  $l = New-Object System.Windows.Forms.Label
  $l.Text = $text
  $l.ForeColor = $color
  $l.BackColor = [System.Drawing.Color]::Black
  $l.Font = New-Object System.Drawing.Font("Consolas",$size,[System.Drawing.FontStyle]::Bold)
  $l.AutoSize = $true
  $l.Location = New-Object System.Drawing.Point($x,$y)
  $panel.Controls.Add($l)
  return $l
}
$title = Add-Text "!!! YOUR FILES HAVE BEEN ENCRYPTED !!!" 70 55 30 ([System.Drawing.Color]::Red)
$warning = Add-Text "Your documents and personal files are no longer accessible." 75 125 17 ([System.Drawing.Color]::White)
$line2 = Add-Text "Do not shut down this computer. Your recovery window is running." 75 160 15 ([System.Drawing.Color]::White)
$caption = Add-Text "TIME REMAINING" 82 215 12 ([System.Drawing.Color]::Gray)
$timerLabel = Add-Text "24:00:00" 75 235 34 ([System.Drawing.Color]::Red)
$keyCaption = Add-Text "ENTER RECOVERY KEY" 75 330 14 ([System.Drawing.Color]::White)
$keyBox = New-Object System.Windows.Forms.TextBox
$keyBox.Size = New-Object System.Drawing.Size(560,48)
$keyBox.Font = New-Object System.Drawing.Font("Consolas",18)
$keyBox.BackColor = [System.Drawing.Color]::FromArgb(20,20,20)
$keyBox.ForeColor = [System.Drawing.Color]::White
$keyBox.Location = New-Object System.Drawing.Point(75,365)
$panel.Controls.Add($keyBox)
$status = Add-Text "STATUS: FILE RECOVERY LOCKED" 75 435 13 ([System.Drawing.Color]::Red)
$clown = Add-Text "     .------.     .------." 760 190 18 ([System.Drawing.Color]::Red)
$clown2 = Add-Text "   .'  o  o  '. .'  o  o  '." 760 225 14 ([System.Drawing.Color]::Red)
$clown3 = Add-Text "  /     __     \\     __     \" 760 255 14 ([System.Drawing.Color]::Red)
$clown4 = Add-Text " |    .----.    |   .----.   |" 760 285 14 ([System.Drawing.Color]::Red)
$clown5 = Add-Text "  \\   \\__/   /     \\__/   /" 760 315 14 ([System.Drawing.Color]::Red)
$clown6 = Add-Text "   '.________.'       '.___.'" 760 345 14 ([System.Drawing.Color]::Red)
$scary = Add-Text "THERE IS NO WAY BACK." 760 440 15 ([System.Drawing.Color]::DarkRed)
$scary2 = Add-Text "YOUR DEADLINE IS RUNNING." 760 475 15 ([System.Drawing.Color]::DarkRed)
$scary3 = Add-Text "EVERY SECOND COUNTS." 760 510 15 ([System.Drawing.Color]::DarkRed)
$remaining = 86400
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 1000
$timer.Add_Tick({
  if ($remaining -gt 0) { $remaining-- }
  $h = [math]::Floor($remaining / 3600)
  $m = [math]::Floor(($remaining % 3600) / 60)
  $s = $remaining % 60
  $timerLabel.Text = "{0:00}:{1:00}:{2:00}" -f $h,$m,$s
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
    $status.Text = "RECOVERY KEY REJECTED"
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
