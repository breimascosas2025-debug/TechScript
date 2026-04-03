@echo off
title Tech Script - Bloatware
color 0C

net session >nul 2>&1
if %errorLevel% neq 0 (
 echo =====================================
 echo   ERROR: Ejecutar como administrador
 echo =====================================
 pause
 exit
)

echo =========================
echo       TECH SCRIPT
echo   ELIMINANDO BLOATWARE
echo =========================

echo Eliminando apps innecesarias...

powershell -Command "Get-AppxPackage *xbox* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *skype* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *solitaire* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *onedrive* | Remove-AppxPackage"

echo Bloatware eliminado.

pause