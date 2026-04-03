@echo off
title Tech Script - Red PRO
color 0A

net session >nul 2>&1
if %errorLevel% neq 0 (
 echo ERROR: Ejecutar como administrador
 pause
 exit
)

echo =========================
echo       TECH SCRIPT
echo   LIMPIEZA DE RED
echo =========================

ipconfig /release
ipconfig /renew
ipconfig /flushdns

netsh winsock reset
netsh int ip reset

echo Red optimizada.

set /p restart=Este comando requiere reiniciar la PC. ¿Deseas aceptar? (S/N):
if /i "%restart%"=="S" shutdown /r /t 0

pause