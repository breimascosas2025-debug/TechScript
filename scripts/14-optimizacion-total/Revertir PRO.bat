@echo off
title Tech Script - Revertir PRO
color 0B

net session >nul 2>&1
if %errorLevel% neq 0 (
 echo ERROR: Ejecutar como administrador
 pause
 exit
)

echo Restaurando configuraciones básicas...

powercfg -h on

echo Para restaurar completamente usa el punto de restauración creado.

pause