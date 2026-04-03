@echo off
title Tech Script - Limpiar Logs
color 0A

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: Ejecutar como administrador
    pause
    exit
)

echo ======================
echo     TECH SCRIPT
echo   LIMPIANDO LOGS
echo ======================

del /f /q C:\Windows\Logs\*
del /f /q C:\Windows\System32\LogFiles\*

echo Logs eliminados.

pause