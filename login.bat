@echo off
setlocal EnableExtensions EnableDelayedExpansion

:: ===============================
:: 2FA CODE (basic obfuscation)
:: ===============================
set a=1
set b=2
set c=3
set "CODE=!a!!b!!c!"

echo.
set /p "INPUT=Enter 2FA code: "

if not defined INPUT (
    goto fail
)

if "!INPUT!"=="!CODE!" (
    call main.bat granted
    exit /b
)

:: ===============================
:: FAIL BLOCK
:: ===============================
:fail

:: Windows error popup
powershell -NoProfile -Command "[void][System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('Integrity verification failed.`n`nThis executable is not an official release.`n`nError Code: SIGMIS-0x2FA01','Application Error',[System.Windows.Forms.MessageBoxButtons]::OK,[System.Windows.Forms.MessageBoxIcon]::Error)"


echo.
echo ACCESS DENIED
echo Integrity check failed.
echo.
echo illegal copy detected 
echo delte it now error (:256!batch panic!)
echo Official releases:
echo https://github.com/teamjynxzerhacking
echo.

pause
exit /b
