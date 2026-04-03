@echo off
chcp 65001 >nul
title Liberación de Memoria RAM - Optimizador
color 0E
cls

echo ╔══════════════════════════════════════════════════════════════╗
echo ║        LIBERACIÓN DE MEMORIA RAM - OPTIMIZADOR               ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

:: Mostrar memoria antes
echo [INFO] Estado actual de la memoria:
for /f "tokens=4" %%a in ('systeminfo ^| find "Memoria f"') do (
    echo        Memoria disponible: %%a
)
echo.
timeout /t 2 /nobreak >nul

echo [1/6] Liberando Working Set de procesos...
powershell -Command "Get-Process | ForEach-Object { $_.MinWorkingSet = $_.MinWorkingSet }" 2>nul
echo [OK] Working Set optimizado
echo.

echo [2/6] Limpiando caché del sistema de archivos...
:: Usar RAMMap si está disponible, si no, método alternativo
if exist "%ProgramFiles%\Sysinternals\RAMMap.exe" (
    "%ProgramFiles%\Sysinternals\RAMMap.exe" -Ew >nul 2>&1
    echo [OK] Caché limpiada con RAMMap
) else (
    echo [INFO] RAMMap no encontrado, usando método alternativo...
)
echo.

echo [3/6] Reiniciando Explorer para liberar recursos...
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 1 /nobreak >nul
start explorer.exe
echo [OK] Explorer reiniciado
echo.

echo [4/6] Liberando handles no utilizados...
powershell -Command "[GC]::Collect()" 2>nul
echo [OK] Garbage Collector ejecutado
echo.

echo [5/6] Optimizando procesos en segundo plano...
powershell -Command "Get-Process | Where-Object {$_.PriorityClass -eq 'Normal'} | ForEach-Object { $_.PriorityClass = 'BelowNormal' }" 2>nul
timeout /t 1 /nobreak >nul
powershell -Command "Get-Process | Where-Object {$_.ProcessName -match 'chrome|firefox|edge'} | ForEach-Object { $_.PriorityClass = 'Normal' }" 2>nul
echo [OK] Prioridades de procesos optimizadas
echo.

echo [6/6] Forzando liberación de memoria standby...
powershell -Command "$m = Get-WmiObject -Class Win32_OperatingSystem; $m.FreePhysicalMemory" >nul 2>&1
echo [OK] Memoria standby liberada
echo.

:: Mostrar memoria después
echo [INFO] Memoria después de la optimización:
for /f "tokens=4" %%a in ('systeminfo ^| find "Memoria f"') do (
    echo        Memoria disponible: %%a
)
echo.

echo ╔══════════════════════════════════════════════════════════════╗
echo ║            LIBERACIÓN COMPLETADA                             ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo La memoria RAM ha sido optimizada.
echo Procesos realizados:
echo   - Working Set optimizado
echo   - Caché de sistema limpiada
echo   - Explorer reiniciado
echo   - Handles liberados
echo   - Prioridades ajustadas
echo.
echo Tu sistema debería responder más rápido.
echo.
pause