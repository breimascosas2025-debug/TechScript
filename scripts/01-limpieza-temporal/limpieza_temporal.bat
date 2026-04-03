@echo off
chcp 65001 >nul
title Limpieza Total de Archivos Temporales v2.0
color 0A
cls

echo ╔══════════════════════════════════════════════════════════════╗
echo ║     LIMPIEZA TOTAL DE ARCHIVOS TEMPORALES - Windows       ║
echo ║              Optimización Avanzada v2.0                      ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo [INFO] Iniciando limpieza profunda de archivos temporales...
echo [INFO] Este proceso es seguro y elimina solo archivos innecesarios
echo.
timeout /t 2 /nobreak >nul

echo [1/7] Limpiando carpeta %TEMP% del usuario...
cd /d %temp%
for /f "delims=" %%a in ('dir /s /b /a-d * 2^>nul') do (
    del /f /q "%%a" 2>nul
)
for /f "delims=" %%a in ('dir /s /b /ad * 2^>nul') do (
    rd /s /q "%%a" 2>nul
)
echo [OK] Carpeta %TEMP% limpia
echo.

echo [2/7] Limpiando carpeta TEMP de Windows...
cd /d C:\Windows\Temp 2>nul
for /f "delims=" %%a in ('dir /s /b /a-d * 2^>nul') do (
    del /f /q "%%a" 2>nul
)
for /f "delims=" %%a in ('dir /s /b /ad * 2^>nul') do (
    rd /s /q "%%a" 2>nul
)
echo [OK] Carpeta Windows\Temp limpia
echo.

echo [3/7] Limpiando Prefetch...
del /f /s /q C:\Windows\Prefetch\*.* 2>nul
echo [OK] Prefetch limpiado
echo.

echo [4/7] Limpiando caché de Windows Update...
net stop wuauserv >nul 2>&1
cd /d C:\Windows\SoftwareDistribution\Download 2>nul
del /f /s /q *.* 2>nul
net start wuauserv >nul 2>&1
echo [OK] Caché de Windows Update limpiado
echo.

echo [5/7] Limpiando caché de Internet Explorer/Edge...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255 >nul 2>&1
echo [OK] Caché de navegador limpiado
echo.

echo [6/7] Limpiando archivos de reportes de error...
del /f /s /q C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\WER\*.* 2>nul
del /f /s /q C:\ProgramData\Microsoft\Windows\WER\*.* 2>nul
echo [OK] Reportes de error limpiados
echo.

echo [7/7] Vaciando Papelera de reciclaje...
powershell -Command "Clear-RecycleBin -Confirm:$false" 2>nul
echo [OK] Papelera vaciada
echo.

echo ╔══════════════════════════════════════════════════════════════╗
echo ║              LIMPIEZA COMPLETADA CON ÉXITO                   ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo Se han eliminado archivos temporales de:
echo   - %TEMP% (usuario)
echo   - C:\Windows\Temp
echo   - Prefetch
echo   - Windows Update Download
echo   - Caché de navegador
echo   - Reportes de error Windows
echo   - Papelera de reciclaje
echo.
echo Tu sistema debería funcionar más rápido ahora.
echo.
pause