@echo off
title Tech Scripts - Restauracion Basica
color 0B

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
echo        TECH SCRIPTS - RESET BASICO
echo ============================================
echo.

echo Limpiando red...
ipconfig /flushdns
netsh winsock reset
netsh int ip reset

echo.
echo Reiniciando servicios...
net stop wuauserv
net stop bits
net start wuauserv
net start bits

echo.
echo Limpiando temporales...
del /s /q %temp%\*
del /s /q C:\Windows\Temp\*

echo.
echo ============================================
echo   LISTO - REINICIA EL EQUIPO
echo ============================================
pause