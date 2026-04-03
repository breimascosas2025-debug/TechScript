@echo off
title Tech Script - Reset Red
color 0C

net session >nul 2>&1
if %errorLevel% neq 0 (
 echo ERROR: Ejecutar como administrador
 pause
 exit
)

echo =========================
echo       TECH SCRIPT
echo   RESET DE RED
echo =========================

netsh winsock reset
netsh int ip reset
ipconfig /release
ipconfig /renew

echo Red restablecida.

set /p restart=Este comando requiere reiniciar la PC. ¿Deseas aceptar? (S/N):
if /i "%restart%"=="S" shutdown /r /t 0

pause