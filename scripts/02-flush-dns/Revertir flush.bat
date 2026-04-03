@echo off
title Tech Script - Revertir DNS
color 0A

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: Ejecutar como administrador
    pause
    exit
)

echo Restaurando configuración de red...

netsh int ip reset
netsh winsock reset

echo Reversión completada.

set /p restart=Este comando requiere reiniciar la PC. ¿Deseas aceptar? (S/N):
if /i "%restart%"=="S" shutdown /r /t 0

pause