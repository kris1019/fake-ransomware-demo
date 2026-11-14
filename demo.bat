@echo off
title CRYPTLOCK - SECURITY INCIDENT
mode con cols=100 lines=30
color 0C
set "end=0"
:screen
cls
echo.
echo  ================================================================
echo                    CRYPTLOCK SECURITY INCIDENT
echo  ================================================================
echo.
echo   [!] YOUR FILES HAVE BEEN ENCRYPTED
echo.
echo   This is a SECURITY AWARENESS SIMULATION.
echo   NO FILES ARE ACTUALLY BEING MODIFIED.
echo.
echo   ---------------------------------------------------------------
echo   PAYMENT DEADLINE: 23:59:59
echo   TIME REMAINING : 24:00:00
echo   ---------------------------------------------------------------
echo.
echo   Simulated affected files:
echo      Documents\financial_records.xlsx
echo      Documents\photos\family.jpg
echo      Desktop\projects.zip
echo      Downloads\backup.dat
echo.
echo   STATUS: ENCRYPTION SIMULATION ACTIVE
echo   KEY ID: SIM-%RANDOM%-%RANDOM%
echo.
echo   WARNING: In a real incident, attempting to bypass ransomware
echo   could cause permanent data loss.
echo.
echo   ================================================================
echo   [ENTER]  EXIT SIMULATION
echo   ================================================================
choice /c E /n /m "Press ENTER to exit..."
cls
color 0A
echo.
echo  =================================================================
echo                    SIMULATION COMPLETE
echo  =================================================================
echo.
echo   Nothing was encrypted, deleted, uploaded, or changed.
echo.
echo   This demonstration was designed to show what a ransomware
echo   demand screen can look like without harming the computer.
echo.
pause
exit /b
