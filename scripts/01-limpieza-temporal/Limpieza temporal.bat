@echo off
title Tech Script - Limpieza Total
color 0A

:: Verificar administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo =====================================
    echo   ERROR: Ejecutar como administrador
    echo =====================================
    pause
    exit
)

echo ================================
echo        TECH SCRIPT
echo   LIMPIEZA PROFUNDA ACTIVADA
echo ================================

echo Eliminando archivos temporales...
del /s /f /q %temp%\*
rd /s /q %temp%
mkdir %temp%

del /s /f /q C:\Windows\Temp\*
rd /s /q C:\Windows\Temp
mkdir C:\Windows\Temp

del /s /f /q C:\Windows\Prefetch\*

echo Limpieza completada.

echo.
set /p restart=Este comando requiere reiniciar la PC. ¿Deseas aceptar? (S/N):
if /i "%restart%"=="S" shutdown /r /t 0

pause