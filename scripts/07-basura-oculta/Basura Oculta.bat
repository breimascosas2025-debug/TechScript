@echo off
title Tech Script - Basura Oculta
color 0A

net session >nul 2>&1
if %errorLevel% neq 0 (
 echo ERROR: Ejecutar como administrador
 pause
 exit
)

echo =========================
echo       TECH SCRIPT
echo   LIMPIEZA OCULTA
echo =========================

echo Eliminando archivos basura...

del /s /q C:\*.tmp
del /s /q C:\*.log
del /s /q C:\*.bak
del /s /q C:\Thumbs.db
del /s /q C:\*.old

echo Limpieza completada.
pause