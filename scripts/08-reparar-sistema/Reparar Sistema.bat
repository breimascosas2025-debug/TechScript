@echo off
title Tech Scripts - Reparacion Avanzada Windows
color 0A

:: Verificar permisos de administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ============================================
    echo   ERROR: Ejecuta este script como ADMINISTRADOR
    echo ============================================
    echo.
    pause
    exit
)

echo ============================================
echo        TECH SCRIPTS - REPARACION PRO
echo ============================================
echo.

echo [1/8] Escaneo de archivos del sistema...
sfc /scannow

echo.
echo [2/8] Reparando imagen de Windows...
DISM /Online /Cleanup-Image /RestoreHealth

echo.
echo [3/8] Reparacion profunda DISM...
DISM /Online /Cleanup-Image /StartComponentCleanup
DISM /Online /Cleanup-Image /AnalyzeComponentStore

echo.
echo [4/8] Reparando disco (puede pedir reinicio)...
chkdsk C: /f /r

echo.
echo [5/8] Reiniciando servicios de red...
ipconfig /flushdns
netsh winsock reset
netsh int ip reset

echo.
echo [6/8] Reparando Windows Update...
net stop wuauserv
net stop bits
net stop cryptsvc
del /s /q C:\Windows\SoftwareDistribution\*
net start cryptsvc
net start bits
net start wuauserv

echo.
echo [7/8] Limpiando archivos basura...
del /s /q %temp%\*
del /s /q C:\Windows\Temp\*
cleanmgr /sagerun:1

echo.
echo [8/8] Optimizando sistema...
defrag C: /O

echo.
echo ============================================
echo   PROCESO COMPLETADO - REINICIA EL EQUIPO
echo ============================================
pause