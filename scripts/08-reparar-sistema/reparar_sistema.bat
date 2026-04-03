@echo off
chcp 65001 >nul
title Reparación Básica del Sistema
color 0B
cls

echo ╔══════════════════════════════════════════════════════════════╗
echo ║           REPARACIÓN BÁSICA DEL SISTEMA                      ║
echo ║              Verificación y Corrección                       ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo [INFO] Este script verificará y reparará archivos del sistema.
echo        Puede tardar 15-30 minutos dependiendo del sistema.
echo.
timeout /t 3 /nobreak >nul

echo [1/5] Comprobación de archivos del sistema (SFC)...
echo [INFO] Esto verificará todos los archivos protegidos del sistema
echo Por favor, ESPERA... no cierres esta ventana.
echo ─────────────────────────────────────────
sfc /scannow
echo ─────────────────────────────────────────
echo [OK] Comprobación SFC completada
echo.
timeout /t 2 /nobreak >nul

echo [2/5] Análisis de salud de la imagen de Windows (DISM)...
echo [INFO] Verificando si la imagen de Windows está dañada...
dism /Online /Cleanup-Image /CheckHealth
echo [OK] Análisis de salud completado
echo.
timeout /t 2 /nobreak >nul

echo [3/5] Escaneo de la imagen de Windows (DISM ScanHealth)...
echo [INFO] Escaneando componentes de Windows...
echo Esto puede tardar varios minutos...
dism /Online /Cleanup-Image /ScanHealth
echo [OK] Escaneo completado
echo.
timeout /t 2 /nobreak >nul

echo [4/5] Restauración de la imagen de Windows (DISM RestoreHealth)...
echo [INFO] Reparando componentes dañados si los hay...
echo Esto PUEDE TARDAR 10-20 minutos...
echo ─────────────────────────────────────────
dism /Online /Cleanup-Image /RestoreHealth
echo ─────────────────────────────────────────
echo [OK] Restauración completada
echo.
timeout /t 2 /nobreak >nul

echo [5/5] Verificación de componentes de almacenamiento...
echo [INFO] Comprobando componentes de la Tienda Windows...
dism /Online /Cleanup-Image /AnalyzeComponentStore
echo [OK] Análisis de componentes completado
echo.

echo ╔══════════════════════════════════════════════════════════════╗
echo ║         REPARACIÓN DEL SISTEMA COMPLETADA                    ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo Se han realizado las siguientes operaciones:
echo   ✓ SFC /scannow - Archivos del sistema verificados
echo   ✓ DISM CheckHealth - Estado de imagen comprobado
echo   ✓ DISM ScanHealth - Componentes escaneados
echo   ✓ DISM RestoreHealth - Daños reparados
echo   ✓ Análisis de componentes de almacenamiento
echo.
echo Si se encontraron y repararon errores:
echo   → Reinicia tu PC para aplicar los cambios
echo.
echo Si los problemas persisten:
echo   → Ejecuta el script nuevamente en Modo Seguro
echo.
pause