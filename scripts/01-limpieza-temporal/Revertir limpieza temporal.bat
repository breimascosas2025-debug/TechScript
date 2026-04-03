@echo off
title Tech Script - Revertir Limpieza
color 0B

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: Ejecutar como administrador
    pause
    exit
)

echo Restaurando carpetas del sistema...

if not exist %temp% mkdir %temp%
if not exist C:\Windows\Temp mkdir C:\Windows\Temp

echo Reversión básica completada.
pause