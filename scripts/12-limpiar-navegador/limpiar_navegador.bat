@echo off
chcp 65001 >nul
title Limpieza de Navegadores
color 0D
cls

echo ╔══════════════════════════════════════════════════════════════╗
echo ║              LIMPIEZA DE NAVEGADORES                         ║
echo ║        Chrome, Firefox, Edge, Opera, Brave                   ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo [INFO] Este script limpiará caché, cookies e historial
echo        de todos los navegadores instalados.
echo.
echo ⚠️  Se cerrarán todos los navegadores abiertos.
echo.
timeout /t 3 /nobreak >nul

echo [PASO 0] Cerrando navegadores...
taskkill /F /IM chrome.exe >nul 2>&1
taskkill /F /IM firefox.exe >nul 2>&1
taskkill /F /IM msedge.exe >nul 2>&1
taskkill /F /IM opera.exe >nul 2>&1
taskkill /F /IM brave.exe >nul 2>&1
taskkill /F /IM iexplore.exe >nul 2>&1
echo [OK] Navegadores cerrados
echo.

echo [1/5] Limpiando Google Chrome...
set CHROME_PATH=%LOCALAPPDATA%\Google\Chrome\User Data
if exist "%CHROME_PATH%" (
    rd /s /q "%CHROME_PATH%\Default\Cache" 2>nul
    rd /s /q "%CHROME_PATH%\Default\Code Cache" 2>nul
    rd /s /q "%CHROME_PATH%\Default\GPUCache" 2>nul
    del /f /s /q "%CHROME_PATH%\Default\*History*" 2>nul
    del /f /s /q "%CHROME_PATH%\Default\*Cookies*" 2>nul
    del /f /s /q "%CHROME_PATH%\Default\LOG*" 2>nul
    md "%CHROME_PATH%\Default\Cache" 2>nul
    echo [OK] Chrome limpiado
) else (
    echo [INFO] Chrome no instalado
)
echo.

echo [2/5] Limpiando Mozilla Firefox...
set FIREFOX_PATH=%LOCALAPPDATA%\Mozilla\Firefox\Profiles
if exist "%FIREFOX_PATH%" (
    for /d %%D in ("%FIREFOX_PATH%\*") do (
        rd /s /q "%%D\cache2" 2>nul
        rd /s /q "%%D\startupCache" 2>nul
        rd /s /q "%%D\thumbnails" 2>nul
        del /f /s /q "%%D\*cookies*" 2>nul
        del /f /s /q "%%D\*places.sqlite*" 2>nul
        md "%%D\cache2" 2>nul
    )
    echo [OK] Firefox limpiado
) else (
    echo [INFO] Firefox no instalado
)
echo.

echo [3/5] Limpiando Microsoft Edge...
set EDGE_PATH=%LOCALAPPDATA%\Microsoft\Edge\User Data
if exist "%EDGE_PATH%" (
    rd /s /q "%EDGE_PATH%\Default\Cache" 2>nul
    rd /s /q "%EDGE_PATH%\Default\Code Cache" 2>nul
    rd /s /q "%EDGE_PATH%\Default\GPUCache" 2>nul
    del /f /s /q "%EDGE_PATH%\Default\*History*" 2>nul
    del /f /s /q "%EDGE_PATH%\Default\*Cookies*" 2>nul
    md "%EDGE_PATH%\Default\Cache" 2>nul
    echo [OK] Edge limpiado
) else (
    echo [INFO] Edge no instalado
)
echo.

echo [4/5] Limpiando Opera...
set OPERA_PATH=%LOCALAPPDATA%\Opera Software\Opera Stable
if exist "%OPERA_PATH%" (
    rd /s /q "%OPERA_PATH%\Cache" 2>nul
    rd /s /q "%OPERA_PATH%\Code Cache" 2>nul
    del /f /s /q "%OPERA_PATH%\*Cookies*" 2>nul
    del /f /s /q "%OPERA_PATH%\*History*" 2>nul
    md "%OPERA_PATH%\Cache" 2>nul
    echo [OK] Opera limpiado
) else (
    echo [INFO] Opera no instalado
)
echo.

echo [5/5] Limpiando Brave...
set BRAVE_PATH=%LOCALAPPDATA%\BraveSoftware\Brave-Browser\User Data
if exist "%BRAVE_PATH%" (
    rd /s /q "%BRAVE_PATH%\Default\Cache" 2>nul
    rd /s /q "%BRAVE_PATH%\Default\Code Cache" 2>nul
    del /f /s /q "%BRAVE_PATH%\Default\*Cookies*" 2>nul
    del /f /s /q "%BRAVE_PATH%\Default\*History*" 2>nul
    md "%BRAVE_PATH%\Default\Cache" 2>nul
    echo [OK] Brave limpiado
) else (
    echo [INFO] Brave no instalado
)
echo.

echo [EXTRA] Limpiando Internet Explorer/Edge Legacy...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4351 >nul 2>&1
echo [OK] IE/Edge Legacy limpiado
echo.

echo ╔══════════════════════════════════════════════════════════════╗
echo ║          LIMPIEZA DE NAVEGADORES COMPLETADA                  ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo Se ha limpiado en todos los navegadores detectados:
echo   ✓ Caché de páginas web
echo   ✓ Caché de código JavaScript
echo   ✓ Caché de GPU
echo   ✓ Cookies (opcional, depende del navegador)
echo   ✓ Archivos de historial
echo   ✓ Logs y archivos temporales
echo.
echo NOTA: Los navegadores recrearán la caché al usarse.
echo       La primera carga de páginas puede ser más lenta.
echo.
pause