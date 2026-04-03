@echo off
title Tech Script - Windows Update
color 0A

net session >nul 2>&1
if %errorLevel% neq 0 (
 echo ERROR: Ejecutar como administrador
 pause
 exit
)

echo =========================
echo       TECH SCRIPT
echo   LIMPIANDO UPDATE
echo =========================

net stop wuauserv
net stop bits

del /s /q C:\Windows\SoftwareDistribution\*

net start wuauserv
net start bits

echo Limpieza completada.

set /p restart=¿Deseas reiniciar la PC? (S/N):
if /i "%restart%"=="S" shutdown /r /t 0

pause