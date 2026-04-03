@echo off
title Tech Script - Revertir Servicios
color 0A

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: Ejecutar como administrador
    pause
    exit
)

sc config DiagTrack start= auto
sc start DiagTrack

sc config dmwappushservice start= auto
sc start dmwappushservice

echo Servicios restaurados.
pause