@echo off
title Tech Script - Revertir Inicio
color 0B

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: Ejecutar como administrador
    pause
    exit
)

powercfg -h on

echo Configuración restaurada.
pause