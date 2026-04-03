@echo off
chcp 65001 >nul
title Limpieza de Logs del Sistema
color 0D
cls

echo ╔══════════════════════════════════════════════════════════════╗
echo ║           LIMPIEZA DE LOGS Y EVENTOS DEL SISTEMA             ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo [INFO] Este script eliminará archivos de registro antiguos
echo        para liberar espacio en disco.
echo.
timeout /t 2 /nobreak >nul

echo [1/8] Limpiando logs de Windows (Event Viewer)...
wevtutil el | Foreach-Object {wevtutil cl "$_.LogName"} 2>nul
echo [OK] Logs de Windows limpiados
echo.

echo [2/8] Limpiando logs de IIS (si existe)...
del /f /s /q C:\inetpub\logs\LogFiles\*.* 2>nul
echo [OK] Logs de IIS limpiados
echo.

echo [3/8] Limpiando logs de Windows Update...
del /f /s /q C:\Windows\Logs\WindowsUpdate\*.* 2>nul
del /f /s /q C:\Windows\Logs\MoSetup\*.* 2>nul
echo [OK] Logs de Windows Update limpiados
echo.

echo [4/8] Limpiando CBS logs (Component Based Servicing)...
:: Comprimir primero el archivo grande
if exist "C:\Windows\Logs\CBS\CBS.log" (
    copy "C:\Windows\Logs\CBS\CBS.log" "C:\Windows\Logs\CBS\CBS.old.log" >nul 2>&1
    echo "" > "C:\Windows\Logs\CBS\CBS.log"
)
del /f /s /q C:\Windows\Logs\CBS\*.cab 2>nul
del /f /s /q C:\Windows\Logs\CBS\*.log 2>nul
echo [OK] Logs CBS limpiados
echo.

echo [5/8] Limpiando logs de instalación...
del /f /s /q C:\Windows\Panther\*.log 2>nul
del /f /s /q C:\Windows\Inf\setupapi.dev.log 2>nul
echo [OK] Logs de instalación limpiados
echo.

echo [6/8] Limpiando logs de defensa de Windows...
del /f /s /q "C:\ProgramData\Microsoft\Windows Defender\Scans\History\*.*" 2>nul
del /f /s /q "C:\ProgramData\Microsoft\Windows Defender\Support\*.*" 2>nul
echo [OK] Logs de Windows Defender limpiados
echo.

echo [7/8] Limpiando logs de driver de dispositivos...
del /f /s /q C:\Windows\Minidump\*.* 2>nul
del /f /s /q C:\Windows\Memory.dmp 2>nul
echo [OK] Minidumps y memory dumps eliminados
echo.

echo [8/8] Limpiando archivos de informe de error...
del /f /s /q C:\ProgramData\Microsoft\Windows\WER\ReportQueue\*.* 2>nul
del /f /s /q C:\ProgramData\Microsoft\Windows\WER\ReportArchive\*.* 2>nul
echo [OK] Cola de reportes de error limpiada
echo.

echo ╔══════════════════════════════════════════════════════════════╗
echo ║              LIMPIEZA DE LOGS COMPLETADA                     ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo Se han eliminado archivos de registro de:
echo   - Visor de eventos de Windows
echo   - IIS (si estaba instalado)
echo   - Windows Update
echo   - Component Based Servicing
echo   - Instalaciones
echo   - Windows Defender
echo   - Drivers (minidumps)
echo   - Reportes de error
echo.
echo Espacio liberado: Variable según sistema
echo.
pause