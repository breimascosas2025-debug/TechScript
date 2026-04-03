@echo off
title Tech Script - OPTIMIZACION PRO
color 0A

net session >nul 2>&1
if %errorLevel% neq 0 (
 echo =====================================
 echo   ERROR: Ejecutar como administrador
 echo =====================================
 pause
 exit
)

echo ===============================
echo        TECH SCRIPT PRO
echo    OPTIMIZACION TOTAL
echo ===============================

echo Creando punto de restauracion...
powershell -Command "Checkpoint-Computer -Description 'TechScript Restore'"

echo Limpiando temporales...
del /s /f /q %temp%\*
del /s /f /q C:\Windows\Temp\*

echo Limpiando DNS...
ipconfig /flushdns

echo Reparando sistema...
sfc /scannow

echo Optimizando disco...
defrag C: /O

echo Desactivando hibernacion...
powercfg -h off

echo Optimización completa finalizada.

set /p restart=Este comando requiere reiniciar la PC. ¿Deseas aceptar? (S/N):
if /i "%restart%"=="S" shutdown /r /t 0

pause