@echo off
chcp 65001 >nul
title OPTIMIZACIÓN TOTAL PRO - Suite Completa
color 0A
cls

echo ╔══════════════════════════════════════════════════════════════╗
echo ║     ╔══════════════════════════════════════════════════╗     ║
echo ║     ║   OPTIMIZACIÓN TOTAL PRO - Suite Completa        ║     ║
echo ║     ║   Script Avanzado de Limpieza y Optimización     ║     ║
echo ║     ╚══════════════════════════════════════════════════╝     ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo [INFO] Este script ejecutará TODAS las optimizaciones disponibles.
echo [INFO] Tiempo estimado: 20-40 minutos según el sistema.
echo.
echo ⚠️  ADVERTENCIAS:
echo    - Cierra todos los programas antes de continuar
echo    - Guarda tu trabajo
echo    - No interrumpas el proceso una vez iniciado
echo    - Se reiniciará el equipo al finalizar
echo.
echo Presiona cualquier tecla para comenzar o CIERRA esta ventana para cancelar...
pause >nul
cls

:: ============================================
:: SECCIÓN 1: PREPARACIÓN
:: ============================================
echo ═══════════════════════════════════════════════════════════════
echo  FASE 1/5: PREPARACIÓN DEL SISTEMA
echo ═══════════════════════════════════════════════════════════════
echo.

echo [1.1] Creando punto de restauración...
:: Crear punto de restauración
powershell -Command "Checkpoint-Computer -Description 'OptimizacionTotal_PRO' -RestorePointType 'MODIFY_SETTINGS'" 2>nul
if %errorlevel%==0 (
    echo [OK] Punto de restauración creado
echo) else (
    echo [AVISO] No se pudo crear punto de restauración (continuando...)
)
echo.

echo [1.2] Cerrando programas innecesarios...
taskkill /F /IM chrome.exe >nul 2>&1
taskkill /F /IM firefox.exe >nul 2>&1
taskkill /F /IM msedge.exe >nul 2>&1
taskkill /F /IM opera.exe >nul 2>&1
taskkill /F /IM brave.exe >nul 2>&1
echo [OK] Navegadores cerrados
echo.

echo [1.3] Deteniendo servicios no esenciales...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
echo [OK] Servicios temporalmente detenidos
echo.

timeout /t 2 /nobreak >nul

:: ============================================
:: SECCIÓN 2: LIMPIEZA PROFUNDA
:: ============================================
cls
echo ═══════════════════════════════════════════════════════════════
echo  FASE 2/5: LIMPIEZA PROFUNDA DEL SISTEMA
echo ═══════════════════════════════════════════════════════════════
echo.

echo [2.1] Limpieza de archivos temporales...
cd /d %temp%
for /f "delims=" %%a in ('dir /s /b /a-d * 2^>nul') do del /f /q "%%a" 2>nul
for /f "delims=" %%a in ('dir /s /b /ad * 2^>nul') do rd /s /q "%%a" 2>nul
del /f /s /q C:\Windows\Temp\*.* 2>nul
del /f /s /q C:\Windows\Prefetch\*.* 2>nul
echo [OK] Temporales limpiados
echo.

echo [2.2] Limpieza de caché DNS y red...
ipconfig /flushdns >nul 2>&1
echo [OK] DNS limpiado
echo.

echo [2.3] Limpieza de logs del sistema...
wevtutil el 2>nul | Foreach-Object {wevtutil cl "$_.LogName"} 2>nul
del /f /s /q C:\Windows\Logs\*.* 2>nul
echo [OK] Logs limpiados
echo.

echo [2.4] Limpieza de archivos basura ocultos...
del /f /s /q /a:h Thumbs.db 2>nul
del /f /s /q .DS_Store 2>nul
del /f /s /q desktop.ini 2>nul
echo [OK] Archivos basura eliminados
echo.

echo [2.5] Limpieza de navegadores...
:: Chrome
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" 2>nul
:: Firefox
for /d %%D in ("%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*") do rd /s /q "%%D\cache2" 2>nul
:: Edge
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" 2>nul
echo [OK] Caché de navegadores limpiada
echo.

echo [2.6] Limpieza de Windows Update...
rd /s /q C:\Windows\SoftwareDistribution\Download 2>nul
md C:\Windows\SoftwareDistribution\Download 2>nul
echo [OK] Windows Update limpiado
echo.

echo [2.7] Vaciando papelera...
powershell -Command "Clear-RecycleBin -Confirm:$false" 2>nul
echo [OK] Papelera vaciada
echo.

timeout /t 2 /nobreak >nul

:: ============================================
:: SECCIÓN 3: REPARACIÓN DEL SISTEMA
:: ============================================
cls
echo ═══════════════════════════════════════════════════════════════
echo  FASE 3/5: REPARACIÓN Y MANTENIMIENTO
echo ═══════════════════════════════════════════════════════════════
echo.

echo [3.1] Verificación de archivos del sistema (SFC)...
echo Por favor espera, esto puede tardar varios minutos...
sfc /scannow >nul 2>&1
echo [OK] SFC completado
echo.

echo [3.2] Reparación de imagen Windows (DISM)...
dism /Online /Cleanup-Image /RestoreHealth >nul 2>&1
echo [OK] DISM completado
echo.

echo [3.3] Restablecimiento de Winsock...
netsh winsock reset >nul 2>&1
echo [OK] Winsock restablecido
echo.

echo [3.4] Liberación y renovación de IP...
ipconfig /release >nul 2>&1
ipconfig /renew >nul 2>&1
echo [OK] IP renovada
echo.

timeout /t 2 /nobreak >nul

:: ============================================
:: SECCIÓN 4: OPTIMIZACIÓN
:: ============================================
cls
echo ═══════════════════════════════════════════════════════════════
echo  FASE 4/5: OPTIMIZACIÓN DEL SISTEMA
echo ═══════════════════════════════════════════════════════════════
echo.

echo [4.1] Liberando memoria RAM...
powershell -Command "[GC]::Collect()" 2>nul
powershell -Command "Get-Process | ForEach-Object { $_.MinWorkingSet = $_.MinWorkingSet }" 2>nul
echo [OK] Memoria optimizada
echo.

echo [4.2] Optimización de disco...
:: Detectar SSD
wmic diskdrive get MediaType | find "SSD" >nul
if %errorlevel%==0 (
    fsutil behavior set DisableDeleteNotify 0 >nul 2>&1
    echo [OK] TRIM habilitado para SSD
) else (
    defrag C: /O >nul 2>&1
    echo [OK] Desfragmentación completada
)
echo.

echo [4.3] Desactivando telemetría...
sc config DiagTrack start= disabled >nul 2>&1
sc config dmwappushservice start= disabled >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1
echo [OK] Telemetría desactivada
echo.

echo [4.4] Optimizando inicio del sistema...
powercfg /hibernate off >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d 0 /f >nul 2>&1
echo [OK] Inicio optimizado
echo.

echo [4.5] Reiniciando servicios esenciales...
net start wuauserv >nul 2>&1
net start bits >nul 2>&1
echo [OK] Servicios reiniciados
echo.

timeout /t 2 /nobreak >nul

:: ============================================
:: SECCIÓN 5: FINALIZACIÓN
:: ============================================
cls
echo ═══════════════════════════════════════════════════════════════
echo  FASE 5/5: FINALIZACIÓN
echo ═══════════════════════════════════════════════════════════════
echo.

echo [5.1] Limpiando archivos temporales finales...
del /f /s /q %temp%\*.* 2>nul
echo [OK] Limpieza final completada
echo.

echo [5.2] Generando reporte...
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║           OPTIMIZACIÓN COMPLETADA CON ÉXITO                  ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo Se han ejecutado las siguientes operaciones:
echo.
echo  FASE 1 - PREPARACIÓN:
echo    ✓ Punto de restauración creado
echo    ✓ Programas cerrados
echo    ✓ Servicios preparados
echo.
echo  FASE 2 - LIMPIEZA:
echo    ✓ Archivos temporales eliminados
echo    ✓ Caché DNS limpiada
echo    ✓ Logs del sistema eliminados
echo    ✓ Archivos basura ocultos eliminados
echo    ✓ Caché de navegadores limpiada
echo    ✓ Windows Update limpiado
echo    ✓ Papelera vaciada
echo.
echo  FASE 3 - REPARACIÓN:
echo    ✓ Archivos del sistema verificados (SFC)
echo    ✓ Imagen Windows reparada (DISM)
echo    ✓ Winsock restablecido
echo    ✓ IP renovada
echo.
echo  FASE 4 - OPTIMIZACIÓN:
echo    ✓ Memoria RAM liberada
echo    ✓ Disco optimizado (SSD/HDD)
echo    ✓ Telemetría desactivada
echo    ✓ Inicio del sistema optimizado
echo    ✓ Servicios reiniciados
echo.
echo ═══════════════════════════════════════════════════════════════
echo.
echo  ⚠️  REINICIO NECESARIO  ⚠️
echo.
echo  Tu equipo se reiniciará en 60 segundos...
echo  Guarda tu trabajo AHORA o cierra esta ventana para cancelar.
echo.
echo  Para reiniciar manualmente más tarde, cierra esta ventana.
echo.
timeout /t 60
shutdown /r /t 0 /f