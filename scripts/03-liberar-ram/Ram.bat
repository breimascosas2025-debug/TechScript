@echo off
title Tech Script - Liberar RAM
color 0A

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: Ejecutar como administrador
    pause
    exit
)

echo ======================
echo     TECH SCRIPT
echo   LIBERANDO RAM
echo ======================

echo Cerrando procesos innecesarios...
taskkill /f /im chrome.exe >nul 2>&1
taskkill /f /im msedge.exe >nul 2>&1

echo Optimizando memoria...
wmic process where "name='explorer.exe'" delete
start explorer.exe

echo RAM optimizada.
pause