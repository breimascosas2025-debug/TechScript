@echo off
title Tech Script - Revertir Update
color 0B

net session >nul 2>&1
if %errorLevel% neq 0 (
 echo ERROR: Ejecutar como administrador
 pause
 exit
)

net start wuauserv
net start bits

echo Servicios restaurados.
pause