@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

set nssmver=nssm-2.24
set zipfile=%nssmver%.zip

curl --fail --output %zipfile% https://nssm.cc/release/%zipfile%
if %errorlevel% neq 0 (
    echo Fail to download NSSM
    pause
    goto End
)

if not exist %zipfile% (
    echo %zipfile% not found
    pause
    goto End	
)

powershell -command "Expand-Archive -Force %zipfile% ."

if not exist %nssmver%\win64\nssm.exe (
    echo nssm.exe not found
    pause
    goto End	
)

copy /Y %nssmver%\win64\nssm.exe "%currdir%"

del /f /q %zipfile%
rmdir /s /q %nssmver%

:END
echo bye
timeout /t 5