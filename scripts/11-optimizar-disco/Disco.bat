@echo off
title Tech Script - Disco
color 0A

net session >nul 2>&1
if %errorLevel% neq 0 (
 echo ERROR: Ejecutar como administrador
 pause
 exit
)

echo =========================
echo       TECH SCRIPT
echo   OPTIMIZANDO DISCO
echo =========================

echo Verificando disco...
chkdsk C: /f

echo Optimizando...
defrag C: /O

echo Optimización completada.

set /p restart=Este comando requiere reiniciar la PC. ¿Deseas aceptar? (S/N):
if /i "%restart%"=="S" shutdown /r /t 0

pause