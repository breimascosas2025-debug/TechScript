@echo off
chcp 65001 >nul
title Eliminación de Archivos Basura Ocultos
color 0E
cls

echo ╔══════════════════════════════════════════════════════════════╗
echo ║        ELIMINACIÓN DE ARCHIVOS BASURA OCULTOS                ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo [INFO] Este script busca y elimina archivos ocultos que
echo        consumen espacio: thumbs.db, .DS_Store, archivos vacíos, etc.
echo.
timeout /t 2 /nobreak >nul

echo [1/7] Eliminando Thumbs.db (caché de miniaturas)...
del /f /s /q /a:h Thumbs.db 2>nul
del /f /s /q Thumbs.db 2>nul
echo [OK] Thumbs.db eliminados
echo.

echo [2/7] Eliminando .DS_Store (archivos de macOS)...
del /f /s /q /a:h .DS_Store 2>nul
del /f /s /q .DS_Store 2>nul
echo [OK] Archivos .DS_Store eliminados
echo.

echo [3/7] Eliminando archivos desktop.ini innecesarios...
del /f /s /q desktop.ini 2>nul
echo [OK] Archivos desktop.ini eliminados
echo.

echo [4/7] Buscando y eliminando archivos vacíos (0 bytes)...
for /r C:\ %%F in (*) do @if %%~zF==0 del "%%F" 2>nul
echo [OK] Archivos vacíos eliminados
echo.

echo [5/7] Eliminando archivos de instalación antiguos...
del /f /s /q C:\Windows\Installer\*.tmp 2>nul
del /f /s /q C:\Windows\Installer\*.bak 2>nul
echo [OK] Archivos temporales de instalación eliminados
echo.

echo [6/7] Limpiando caché de iconos...
ie4uinit.exe -ClearIconCache >nul 2>&1
taskkill /IM explorer.exe /F >nul 2>&1
del /f /s /q /a:h "%localappdata%\IconCache.db" 2>nul
start explorer.exe
echo [OK] Caché de iconos limpiada
echo.

echo [7/7] Eliminando archivos de actualización antiguos...
del /f /s /q C:\Windows\*.log 2>nul
del /f /s /q C:\Windows\*.bak 2>nul
del /f /s /q C:\Windows\*.tmp 2>nul
echo [OK] Archivos de log/bak/tmp eliminados
echo.

echo ╔══════════════════════════════════════════════════════════════╗
echo ║           LIMPIEZA DE BASURA OCULTA COMPLETADA               ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo Se han eliminado archivos ocultos:
echo   ✓ Thumbs.db (miniaturas)
echo   ✓ .DS_Store (macOS)
echo   ✓ desktop.ini
echo   ✓ Archivos vacíos (0 bytes)
echo   ✓ Archivos temporales de instalación
echo   ✓ Caché de iconos
echo   ✓ Logs, backups y temporales
echo.
echo NOTA: Los archivos Thumbs.db se regenerarán al navegar carpetas
echo       con imágenes (esto es normal).
echo.
pause