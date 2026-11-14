$Host.UI.RawUI.WindowTitle = "CRYPTLOCK - SECURITY INCIDENT"

Clear-Host

Write-Host ""
Write-Host "================================================================" -ForegroundColor Red
Write-Host "                 CRYPTLOCK SECURITY INCIDENT" -ForegroundColor Red
Write-Host "================================================================" -ForegroundColor Red
Write-Host ""
Write-Host " [!] YOUR FILES HAVE BEEN ENCRYPTED" -ForegroundColor Red
Write-Host ""
Write-Host " This is a SECURITY AWARENESS SIMULATION." -ForegroundColor Yellow
Write-Host " NO FILES ARE ACTUALLY BEING MODIFIED." -ForegroundColor Green
Write-Host ""
Write-Host "----------------------------------------------------------------"
Write-Host " PAYMENT DEADLINE: 23:59:59"
Write-Host " TIME REMAINING : 24:00:00"
Write-Host "----------------------------------------------------------------"
Write-Host ""
Write-Host " Simulated affected files:"
Write-Host "    Documents\financial_records.xlsx"
Write-Host "    Documents\photos\family.jpg"
Write-Host "    Desktop\projects.zip"
Write-Host "    Downloads\backup.dat"
Write-Host ""
Write-Host " STATUS: ENCRYPTION SIMULATION ACTIVE" -ForegroundColor Red
Write-Host " KEY ID: SIM-$((Get-Random))-$(Get-Random)"
Write-Host ""
Write-Host " WARNING: This is only a demonstration."
Write-Host ""
Write-Host "================================================================"
Write-Host " [ENTER]  EXIT SIMULATION"
Write-Host "================================================================"
Write-Host ""

Read-Host "Press ENTER to exit"

Clear-Host

Write-Host ""
Write-Host "================================================================" -ForegroundColor Green
Write-Host "                  SIMULATION COMPLETE" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
Write-Host " Nothing was encrypted, deleted, uploaded, or changed." -ForegroundColor Green
Write-Host ""
Read-Host "Press ENTER to close"
