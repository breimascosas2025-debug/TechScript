@echo off
chcp 65001 >nul
title Flush DNS - Limpieza de Caché DNS
color 0B
cls

echo ╔══════════════════════════════════════════════════════════════╗
echo ║            FLUSH DNS - LIMPIEZA DE CACHÉ DNS                 ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo [INFO] Este script limpiará la caché DNS del sistema
echo [INFO] Útil para resolver problemas de navegación web
echo.
timeout /t 2 /nobreak >nul

echo [1/4] Liberando caché DNS...
ipconfig /flushdns
echo.

echo [2/4] Renovando dirección IP...
ipconfig /release >nul 2>&1
ipconfig /renew >nul 2>&1
echo [OK] IP renovada
echo.

echo [3/4] Limpiando caché de resolución de nombres...
net stop dnscache >nul 2>&1
net start dnscache >nul 2>&1
echo [OK] Servicio DNS reiniciado
echo.

echo [4/4] Mostrando configuración DNS actual...
ipconfig /displaydns | findstr "Nombre de host" | head -5
echo.

echo ╔══════════════════════════════════════════════════════════════╗
echo ║                    PROCESO COMPLETADO                        ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo Se ha limpiado la caché DNS exitosamente.
echo Esto puede resolver problemas como:
echo   - Páginas web que no cargan
echo   - Errores DNS_PROBE_FINISHED
echo   - Cambios de DNS no reflejados
echo.
echo Reinicia tu navegador para aplicar los cambios.
echo.
pause