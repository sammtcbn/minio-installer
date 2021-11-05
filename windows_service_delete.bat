@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

C:\minio\nssm stop minio
C:\minio\nssm remove minio confirm

:END
echo bye
timeout /t 3
