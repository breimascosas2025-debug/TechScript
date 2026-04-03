@echo off
chcp 65001 >nul
title Optimización de Inicio de Windows
color 0A
cls

echo ╔══════════════════════════════════════════════════════════════╗
echo ║         OPTIMIZACIÓN DE INICIO DE WINDOWS                    ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo [INFO] Este script acelerará el inicio de Windows
echo        desactivando programas innecesarios del arranque.
echo.
timeout /t 2 /nobreak >nul

echo [1/6] Desactivando programas del inicio vía registro...
:: Desactivar OneDrive del inicio
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "OneDrive" /f >nul 2>&1
echo [OK] OneDrive desactivado del inicio
echo.

echo [2/6] Desactivando Cortana del inicio...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul 2>&1
echo [OK] Cortana desactivada del inicio
echo.

echo [3/6] Desactivando actualizaciones automáticas de Office...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "OfficeBackgroundTaskHandlerRegistration" /f >nul 2>&1
echo [OK] Tareas de Office en segundo plano desactivadas
echo.

echo [4/6] Desactivando Skype del inicio...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "Skype" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "Skype for Desktop" /f >nul 2>&1
echo [OK] Skype desactivado del inicio
echo.

echo [5/6] Limpiando tareas programadas innecesarias...
schtasks /change /tn "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\Autochk\Proxy" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable >nul 2>&1
echo [OK] Tareas de telemetría desactivadas
echo.

echo [6/6] Optimizando configuración de inicio rápido...
powershell -Command "powercfg /hibernate off" >nul 2>&1
echo [OK] Hibernación desactivada (mejora inicio/apagado)
echo.

echo ╔══════════════════════════════════════════════════════════════╗
echo ║            OPTIMIZACIÓN COMPLETADA                           ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo Se han realizado las siguientes optimizaciones:
echo   ✓ Programas del inicio limpiados del registro
echo   ✓ Cortana desactivada del arranque
echo   ✓ Tareas de Office en segundo plano desactivadas
echo   ✓ Skype desactivado del inicio
echo   ✓ Tareas de telemetría deshabilitadas
echo   ✓ Hibernación desactivada (inicio más rápido)
echo.
echo NOTA: Para gestionar más programas de inicio:
echo       Presiona Ctrl+Shift+Esc → Inicio
echo.
echo Reinicia tu PC para notar la diferencia.
echo.
pause