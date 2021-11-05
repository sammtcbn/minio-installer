@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

set installpath=C:\minio

call minio-download-windows.bat
call nssm-download.bat

robocopy minio %installpath% /E
mkdir C:\minio\data

copy /Y "%currdir%\windows_service_create.bat" %installpath%
copy /Y "%currdir%\windows_service_delete.bat" %installpath%
copy /Y "%currdir%\windows_uninstall.bat" %installpath%
copy /Y "%currdir%\firewall_allow_minio.bat" %installpath%
copy /Y "%currdir%\firewall_delete_minio.bat" %installpath%
copy /Y "%currdir%\nssm.exe" %installpath%\bin

call windows_service_create.bat
call firewall_allow_minio.bat

:END
echo bye
timeout /t 3
