@echo off
title Tech Script - Navegadores
color 0A

net session >nul 2>&1
if %errorLevel% neq 0 (
 echo ERROR: Ejecutar como administrador
 pause
 exit
)

echo =========================
echo       TECH SCRIPT
echo   LIMPIANDO NAVEGADORES
echo =========================

echo Cerrando navegadores...
taskkill /f /im chrome.exe >nul 2>&1
taskkill /f /im msedge.exe >nul 2>&1
taskkill /f /im firefox.exe >nul 2>&1

echo Eliminando cache...

rd /s /q "%localappdata%\Google\Chrome\User Data\Default\Cache"
rd /s /q "%localappdata%\Microsoft\Edge\User Data\Default\Cache"
rd /s /q "%appdata%\Mozilla\Firefox\Profiles"

echo Limpieza completada.
pause