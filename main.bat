@echo off
setlocal EnableExtensions EnableDelayedExpansion

:: povolení jen z 2FA
if "%1"=="granted" goto granted

echo ACCESS DENIED
pause
powershell -NoProfile -Command ^
"[void][System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); ^
[System.Windows.Forms.MessageBox]::Show('Integrity verification failed.`n`nThis executable is not an official release.`n`nError Code: SIGMIS-0x2FA01','Application Error',[System.Windows.Forms.MessageBoxButtons]::OK,[System.Windows.Forms.MessageBoxIcon]::Error)"
exit /b

:granted
cls
echo granted
echo =============================
echo (1) nslookup
echo (2) exit
echo =============================
set /p option=enter an option: 

if "%option%"=="1" (
    set /p host=Enter domain or IP: 
    nslookup %host%
    pause
    goto granted
)

if "%option%"=="2" (
    exit /b
)

echo Invalid option
pause
goto granted
