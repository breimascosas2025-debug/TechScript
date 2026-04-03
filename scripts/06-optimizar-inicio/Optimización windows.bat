@echo off
title Tech Script - Inicio Rapido
color 0A

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: Ejecutar como administrador
    pause
    exit
)

echo ======================
echo     TECH SCRIPT
echo   INICIO RAPIDO
echo ======================

powercfg -h off

echo Desactivando programas de inicio innecesarios...

reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /f

echo Optimización completada.

set /p restart=Este comando requiere reiniciar la PC. ¿Deseas aceptar? (S/N):
if /i "%restart%"=="S" shutdown /r /t 0

pause