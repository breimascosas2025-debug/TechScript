@echo off
chcp 65001 >nul
title Limpieza de Windows Update
color 0A
cls

echo ╔══════════════════════════════════════════════════════════════╗
echo ║            LIMPIEZA DE WINDOWS UPDATE                        ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo [INFO] Este script limpiará archivos de actualizaciones
echo        para resolver problemas de Windows Update.
echo.
timeout /t 2 /nobreak >nul

echo [1/7] Deteniendo servicios de Windows Update...
net stop wuauserv >nul 2>&1
net stop cryptSvc >nul 2>&1
net stop bits >nul 2>&1
net stop msiserver >nul 2>&1
echo [OK] Servicios detenidos
echo.

echo [2/7] Eliminando archivos de SoftwareDistribution...
rd /s /q C:\Windows\SoftwareDistribution\Download 2>nul
rd /s /q C:\Windows\SoftwareDistribution\DataStore 2>nul
md C:\Windows\SoftwareDistribution\Download 2>nul
md C:\Windows\SoftwareDistribution\DataStore 2>nul
echo [OK] Carpetas de SoftwareDistribution limpiadas
echo.

echo [3/7] Eliminando archivos de catroot2...
rd /s /q C:\Windows\System32\catroot2.old 2>nul
rename C:\Windows\System32\catroot2 catroot2.old 2>nul
md C:\Windows\System32\catroot2 2>nul
echo [OK] Catroot2 renombrada (se regenerará)
echo.

echo [4/7] Restaurando componentes de Windows Update...
:: Registrar DLLs de Windows Update
regsvr32 /u wuaueng.dll /s >nul 2>&1
regsvr32 wuaueng.dll /s >nul 2>&1
regsvr32 wucltui.dll /s >nul 2>&1
regsvr32 wups.dll /s >nul 2>&1
regsvr32 wuweb.dll /s >nul 2>&1
echo [OK] Componentes registrados
echo.

echo [5/7] Restableciendo BITS...
bitsadmin.exe /reset /allusers >nul 2>&1
echo [OK] BITS restablecido
echo.

echo [6/7] Reiniciando servicios de Windows Update...
net start wuauserv >nul 2>&1
net start cryptSvc >nul 2>&1
net start bits >nul 2>&1
net start msiserver >nul 2>&1
echo [OK] Servicios reiniciados
echo.

echo [7/7] Buscando actualizaciones disponibles...
echo [INFO] Iniciando búsqueda de actualizaciones...
start ms-settings:windowsupdate
echo [OK] Configuración de Windows Update abierta
echo.

echo ╔══════════════════════════════════════════════════════════════╗
echo ║         LIMPIEZA DE WINDOWS UPDATE COMPLETADA                ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo Se han realizado las siguientes operaciones:
echo   ✓ Servicios de Windows Update detenidos y reiniciados
echo   ✓ Carpeta SoftwareDistribution limpiada
echo   ✓ Catroot2 regenerada
echo   ✓ Componentes de Windows Update registrados
echo   ✓ BITS restablecido
echo   ✓ Configuración de Windows Update abierta
echo.
echo AHORA:
echo   1. Ve a Configuración → Windows Update
echo   2. Haz clic en "Buscar actualizaciones"
echo   3. Instala las actualizaciones disponibles
echo.
echo Si el problema persiste, reinicia el equipo e intenta de nuevo.
echo.
pause