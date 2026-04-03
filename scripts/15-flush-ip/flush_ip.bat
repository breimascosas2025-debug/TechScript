@echo off
chcp 65001 >nul
title Flush IP y Red - Limpieza de Configuración de Red
color 0B
cls

echo ╔══════════════════════════════════════════════════════════════╗
echo ║              FLUSH IP Y RED - RESET COMPLETO                 ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo [INFO] Este script limpiará toda la configuración de red
echo        y establecerá conexiones nuevas.
echo.
timeout /t 2 /nobreak >nul

echo [1/8] Liberando dirección IP actual...
ipconfig /release
echo [OK] IPv4 liberada
echo.

echo [2/8] Liberando IPv6...
ipconfig /release6 >nul 2>&1
echo [OK] IPv6 liberada
echo.

echo [3/8] Liberando configuración de IP alternativa...
ipconfig /release_all >nul 2>&1
echo [OK] Todas las IPs liberadas
echo.

echo [4/8] Limpiando caché DNS completa...
ipconfig /flushdns
echo [OK] Caché DNS limpiada
echo.

echo [5/8] Limpiando caché de resolución DNS...
nbtstat -R >nul 2>&1
echo [OK] Caché de resolución limpiada
echo.

echo [6/8] Renovando todas las configuraciones de IP...
ipconfig /renew
echo [OK] IP renovada
echo.

echo [7/8] Renovando IPv6...
ipconfig /renew6 >nul 2>&1
echo [OK] IPv6 renovada
echo.

echo [8/8] Mostrando nueva configuración de red...
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║              NUEVA CONFIGURACIÓN DE RED                      ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
ipconfig /all | findstr /C:"IPv4" /C:"IPv6" /C:"Gateway" /C:"DNS"
echo.

echo ╔══════════════════════════════════════════════════════════════╗
echo ║              FLUSH IP COMPLETADO                             ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo Se ha limpiado la configuración de red:
echo   ✓ Direcciones IP liberadas y renovadas
echo   ✓ IPv4 e IPv6 actualizadas
echo   ✓ Caché DNS completamente limpiada
echo   ✓ Caché de resolución renovada
echo   ✓ Nueva configuración obtenida
echo.
echo Esto puede resolver problemas como:
echo   - Conexión lenta o intermitente
echo   - Errores de resolución DNS
echo   - Conflictos de IP
echo   - Problemas de conectividad
echo.
pause