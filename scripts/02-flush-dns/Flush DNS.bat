@echo off
title Tech Script - Flush DNS
color 0B

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: Ejecutar como administrador
    pause
    exit
)

echo ======================
echo     TECH SCRIPT
echo   LIMPIEZA DNS
echo ======================

ipconfig /flushdns
ipconfig /release
ipconfig /renew

echo DNS limpiado correctamente.

set /p restart=¿Deseas reiniciar la PC? (S/N):
if /i "%restart%"=="S" shutdown /r /t 0

pause