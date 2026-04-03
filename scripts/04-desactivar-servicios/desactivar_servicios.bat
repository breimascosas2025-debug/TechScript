@echo off
chcp 65001 >nul
title Desactivación de Servicios Innecesarios
color 0C
cls

echo ╔══════════════════════════════════════════════════════════════╗
echo ║       DESACTIVACIÓN DE SERVICIOS INNECESARIOS                ║
echo ║              Optimización Avanzada Windows                   ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo ⚠️  ADVERTENCIA: Este script desactivará servicios no esenciales
echo    para mejorar el rendimiento. Lee RESTORE.txt antes de continuar.
echo.
echo Presiona cualquier tecla para continuar o CIERRA esta ventana para cancelar...
pause >nul
cls

echo [INFO] Analizando servicios actuales...
echo.
timeout /t 2 /nobreak >nul

echo [1/10] Desactivando Telemetría de Windows...
sc config DiagTrack start= disabled >nul 2>&1
sc config dmwappushservice start= disabled >nul 2>&1
echo [OK] Telemetría desactivada
echo.

echo [2/10] Desactivando Servicios de Geolocalización...
sc config lfsvc start= disabled >nul 2>&1
sc config MapsBroker start= disabled >nul 2>&1
echo [OK] Geolocalización desactivada
echo.

echo [3/10] Desactivando Biometría (si no usas Windows Hello)...
sc config WbioSrvc start= disabled >nul 2>&1
echo [OK] Servicios biométricos desactivados
echo.

echo [4/10] Desactivando Servicios de Xbox (si no juegas)...
sc config XblAuthManager start= disabled >nul 2>&1
sc config XblGameSave start= disabled >nul 2>&1
sc config XboxNetApiSvc start= disabled >nul 2>&1
echo [OK] Servicios Xbox desactivados
echo.

echo [5/10] Desactivando Windows Search (reindexación)...
sc config WSearch start= disabled >nul 2>&1
echo [OK] Windows Search desactivado
echo    NOTA: La búsqueda de archivos será más lenta
echo.

echo [6/10] Desactivando Superfetch/SysMain...
sc config SysMain start= disabled >nul 2>&1
echo [OK] SysMain desactivado
echo    NOTA: Desactivar solo si tienes SSD
echo.

echo [7/10] Desactivando Registro de errores de Windows...
sc config WerSvc start= disabled >nul 2>&1
echo [OK] Servicio de informes de error desactivado
echo.

echo [8/10] Desactivando Servicios de impresión (si no imprimes)...
sc config Spooler start= disabled >nul 2>&1
echo [OK] Spooler de impresión desactivado
echo    NOTA: No podrás imprimir hasta reactivarlo
echo.

echo [9/10] Desactivando Servicios de fax...
sc config Fax start= disabled >nul 2>&1
echo [OK] Servicio de fax desactivado
echo.

echo [10/10] Desactivando Telefonía...
sc config TapiSrv start= disabled >nul 2>&1
echo [OK] Telefonía desactivada
echo.

echo [EXTRA] Desactivando actualizaciones automáticas de apps...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f >nul 2>&1
echo [OK] Actualizaciones de apps desactivadas
echo.

echo ╔══════════════════════════════════════════════════════════════╗
echo ║              SERVICIOS DESACTIVADOS                          ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo Se han desactivado los siguientes servicios:
echo   ✓ Telemetría y seguimiento
echo   ✓ Geolocalización y mapas
echo   ✓ Servicios biométricos
echo   ✓ Servicios de Xbox (opcional)
echo   ✓ Windows Search (búsqueda)
echo   ✓ SysMain (Superfetch)
echo   ✓ Informes de error
echo   ✓ Spooler de impresión (opcional)
echo   ✓ Fax
echo   ✓ Telefonía
echo.
echo ⚠️  Para REVERTIR estos cambios, ejecuta: revertir_servicios.bat
echo     (incluido en este paquete)
echo.
echo Reinicia tu PC para aplicar todos los cambios.
echo.
pause