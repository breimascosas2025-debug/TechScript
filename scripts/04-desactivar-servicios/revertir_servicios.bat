@echo off
chcp 65001 >nul
title Revertir Servicios - Restaurar Configuración
color 0A
cls

echo ╔══════════════════════════════════════════════════════════════╗
echo ║       RESTAURAR SERVICIOS - REVERSIÓN DE CAMBIOS             ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo [INFO] Este script restaurará los servicios a su estado predeterminado
echo.
timeout /t 2 /nobreak >nul

echo [1/10] Restaurando Telemetría de Windows...
sc config DiagTrack start= auto >nul 2>&1
net start DiagTrack >nul 2>&1
sc config dmwappushservice start= auto >nul 2>&1
net start dmwappushservice >nul 2>&1
echo [OK] Telemetría restaurada
echo.

echo [2/10] Restaurando Servicios de Geolocalización...
sc config lfsvc start= auto >nul 2>&1
net start lfsvc >nul 2>&1
sc config MapsBroker start= auto >nul 2>&1
net start MapsBroker >nul 2>&1
echo [OK] Geolocalización restaurada
echo.

echo [3/10] Restaurando Biometría...
sc config WbioSrvc start= auto >nul 2>&1
net start WbioSrvc >nul 2>&1
echo [OK] Servicios biométricos restaurados
echo.

echo [4/10] Restaurando Servicios de Xbox...
sc config XblAuthManager start= auto >nul 2>&1
net start XblAuthManager >nul 2>&1
sc config XblGameSave start= auto >nul 2>&1
net start XblGameSave >nul 2>&1
sc config XboxNetApiSvc start= auto >nul 2>&1
net start XboxNetApiSvc >nul 2>&1
echo [OK] Servicios Xbox restaurados
echo.

echo [5/10] Restaurando Windows Search...
sc config WSearch start= delayed-auto >nul 2>&1
net start WSearch >nul 2>&1
echo [OK] Windows Search restaurado
echo.

echo [6/10] Restaurando SysMain (Superfetch)...
sc config SysMain start= auto >nul 2>&1
net start SysMain >nul 2>&1
echo [OK] SysMain restaurado
echo.

echo [7/10] Restaurando Registro de errores...
sc config WerSvc start= auto >nul 2>&1
net start WerSvc >nul 2>&1
echo [OK] Servicio de informes restaurado
echo.

echo [8/10] Restaurando Spooler de impresión...
sc config Spooler start= auto >nul 2>&1
net start Spooler >nul 2>&1
echo [OK] Spooler restaurado
echo.

echo [9/10] Restaurando Fax...
sc config Fax start= manual >nul 2>&1
echo [OK] Servicio de fax restaurado
echo.

echo [10/10] Restaurando Telefonía...
sc config TapiSrv start= manual >nul 2>&1
echo [OK] Telefonía restaurada
echo.

echo [EXTRA] Restaurando actualizaciones de apps...
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /f >nul 2>&1
echo [OK] Actualizaciones de apps restauradas
echo.

echo ╔══════════════════════════════════════════════════════════════╗
echo ║           SERVICIOS RESTAURADOS CORRECTAMENTE                ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo Todos los servicios han sido restaurados a su estado original.
echo Reinicia tu PC para aplicar todos los cambios.
echo.
pause