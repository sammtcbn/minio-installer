@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

set dlfile=minio.exe
set dlurl=https://dl.min.io/server/minio/release/windows-amd64/%dlfile%
set foldername=minio

curl --fail --output %dlfile% %dlurl%
if %errorlevel% neq 0 (
    echo Fail to download %dlfile%
    pause
    goto End
)

if not exist %dlfile% (
    echo %dlfile% not found
    pause
    goto End
)

mkdir %foldername%
move /Y %dlfile% %foldername%

:END
echo bye
timeout /t 3
