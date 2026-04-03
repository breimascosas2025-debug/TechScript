@echo off
title Tech Script - Desactivar Servicios
color 0C

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: Ejecutar como administrador
    pause
    exit
)

echo ======================
echo     TECH SCRIPT
echo   OPTIMIZACION
echo ======================

sc stop DiagTrack
sc config DiagTrack start= disabled

sc stop dmwappushservice
sc config dmwappushservice start= disabled

echo Servicios desactivados.
pause