@echo off
title Tech Script - Revertir Bloatware
color 0B

net session >nul 2>&1
if %errorLevel% neq 0 (
 echo ERROR: Ejecutar como administrador
 pause
 exit
)

echo Restaurando apps...

powershell -Command "Get-AppxPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"$($_.InstallLocation)\AppXManifest.xml\"}"

echo Restauración completada.
pause