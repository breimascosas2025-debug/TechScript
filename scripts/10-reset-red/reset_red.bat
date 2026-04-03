@echo off
chcp 65001 >nul
title Reset de Red Completo
color 0B
cls

echo ╔══════════════════════════════════════════════════════════════╗
echo ║              RESET DE RED COMPLETO                           ║
echo ║        Restaurar configuración de red a valores predet.      ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo [INFO] Este script restablecerá toda la configuración de red.
echo        Se perderán configuraciones personalizadas.
echo.
timeout /t 3 /nobreak >nul

echo [1/10] Liberando dirección IP actual...
ipconfig /release
echo [OK] IP liberada
echo.

echo [2/10] Liberando IPv6...
ipconfig /release6 >nul 2>&1
echo [OK] IPv6 liberada
echo.

echo [3/10] Limpiando caché DNS...
ipconfig /flushdns
echo [OK] DNS limpiado
echo.

echo [4/10] Restableciendo Winsock...
netsh winsock reset
echo [OK] Winsock restablecido
echo.

echo [5/10] Restableciendo stack TCP/IP...
netsh int ip reset resetlog.txt
echo [OK] Stack TCP/IP restablecido
echo.

echo [6/10] Liberando y renovando configuración de IP...
ipconfig /renew
echo [OK] IP renovada
echo.

echo [7/10] Restableciendo firewall de Windows...
netsh advfirewall reset
echo [OK] Firewall restablecido
echo.

echo [8/10] Borrando tabla de rutas...
route -f >nul 2>&1
echo [OK] Tabla de rutas borrada
echo.

echo [9/10] Liberando y renovando NetBIOS...
nbtstat -R >nul 2>&1
nbtstat -RR >nul 2>&1
echo [OK] NetBIOS renovado
echo.

echo [10/10] Reiniciando configuración de proxy...
netsh winhttp reset proxy
echo [OK] Proxy restablecido
echo.

echo ╔══════════════════════════════════════════════════════════════╗
echo ║              RESET DE RED COMPLETADO                         ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo Se han restablecido las siguientes configuraciones:
echo   ✓ Dirección IP liberada y renovada
echo   ✓ Caché DNS limpiada
echo   ✓ Winsock restablecido
echo   ✓ Stack TCP/IP reiniciado
echo   ✓ Firewall restablecido
echo   ✓ Tabla de rutas borrada
echo   ✓ NetBIOS renovado
echo   ✓ Configuración de proxy restablecida
echo.
echo ⚠️  IMPORTANTE: Reinicia tu equipo ahora para completar el proceso.
echo.
echo Si usas VPN, deberás reconfigurarla después del reinicio.
echo.
pause