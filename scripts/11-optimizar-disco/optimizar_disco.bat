@echo off
chcp 65001 >nul
title Optimización de Disco Duro/SSD
color 0A
cls

echo ╔══════════════════════════════════════════════════════════════╗
echo ║           OPTIMIZACIÓN DE DISCO DURO/SSD                     ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo [INFO] Este script optimizará el rendimiento del disco.
echo        Detectará automáticamente si tienes HDD o SSD.
echo.
timeout /t 2 /nobreak >nul

echo [1/6] Detectando tipo de disco...
set SSD=0
wmic diskdrive get MediaType | find "SSD" >nul && set SSD=1
wmic diskdrive get MediaType | find "Solid State" >nul && set SSD=1
if %SSD%==1 (
    echo [INFO] SSD detectado - Aplicando optimizaciones para SSD
) else (
    echo [INFO] HDD detectado - Aplicando optimizaciones para HDD
)
echo.
timeout /t 2 /nobreak >nul

echo [2/6] Ejecutando limpieza de disco (cleanmgr)...
cleanmgr /sagerun:1 >nul 2>&1
echo [OK] Limpieza de disco completada
echo.

echo [3/6] Desfragmentando/optimizando unidades...
if %SSD%==1 (
    echo [INFO] Ejecutando TRIM para SSD...
    fsutil behavior set DisableDeleteNotify 0 >nul 2>&1
    defrag C: /O /U /V >nul 2>&1
    echo [OK] TRIM habilitado y optimización completada
) else (
    echo [INFO] Desfragmentando disco duro...
    defrag C: /D /U /V >nul 2>&1
    echo [OK] Desfragmentación completada
)
echo.

echo [4/6] Comprobando errores en el disco...
echo [INFO] Programando comprobación para el siguiente reinicio...
chkntfs /C C: >nul 2>&1
echo [OK] Comprobación programada
echo.

echo [5/6] Optimizando índice de búsqueda...
if %SSD%==1 (
    reg add "HKLM\SOFTWARE\Microsoft\Windows Search" /v "EnableIndexerBackOff" /t REG_DWORD /d 1 /f >nul 2>&1
    echo [OK] Indexador optimizado para SSD
) else (
    echo [INFO] Manteniendo configuración estándar para HDD
)
echo.

echo [6/6] Desactivando funciones innecesarias...
if %SSD%==1 (
    :: Desactivar Superfetch/Prefetch para SSD
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d 0 /f >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 0 /f >nul 2>&1
    echo [OK] Superfetch/Prefetch desactivados para SSD
) else (
    :: Habilitar Superfetch para HDD
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d 1 /f >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 1 /f >nul 2>&1
    echo [OK] Superfetch/Prefetch habilitados para HDD
)
echo.

echo ╔══════════════════════════════════════════════════════════════╗
echo ║           OPTIMIZACIÓN DE DISCO COMPLETADA                   ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
if %SSD%==1 (
    echo Optimizaciones aplicadas para SSD:
    echo   ✓ TRIM habilitado
echo   ✓ Optimización de unidades SSD
echo   ✓ Indexador ajustado
echo   ✓ Superfetch/Prefetch desactivados
echo   ✓ Comprobación de errores programada
) else (
    echo Optimizaciones aplicadas para HDD:
    echo   ✓ Desfragmentación completada
echo   ✓ Limpieza de disco
echo   ✓ Superfetch/Prefetch habilitados
echo   ✓ Comprobación de errores programada
)
echo.
echo ⚠️  Reinicia tu equipo para completar la optimización.
echo.
pause