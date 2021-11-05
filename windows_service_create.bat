@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

C:\minio\nssm install minio "minio.exe"
C:\minio\nssm set minio AppDirectory "C:\minio"
C:\minio\nssm set minio AppParameters "server C:\minio\data"
C:\minio\nssm start minio

:END
echo bye
timeout /t 3
