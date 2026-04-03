@echo off
chcp 65001 >nul
title Eliminación de Bloatware Básico
color 0C
cls

echo ╔══════════════════════════════════════════════════════════════╗
echo ║         ELIMINACIÓN DE BLOATWARE BÁSICO                      ║
echo ║    Elimina apps preinstaladas innecesarias                   ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo [INFO] Este script desinstalará aplicaciones preinstaladas
echo        que consumen recursos y ralentizan el sistema.
echo.
echo ⚠️  Lee RESTORE.txt antes de continuar.
echo.
timeout /t 3 /nobreak >nul

echo [1/8] Eliminando apps de Microsoft (no esenciales)...
powershell -Command "Get-AppxPackage *3dbuilder* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *windowsalarms* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *officehub* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *skypeapp* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *getstarted* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *zunemusic* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *windowsmaps* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *solitairecollection* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *bingfinance* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *zunevideo* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *bingnews* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *onenote* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *people* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *windowsphone* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *bingsports* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *soundrecorder* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *bingweather* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *xboxapp* | Remove-AppxPackage" 2>nul
echo [OK] Apps de Microsoft eliminadas
echo.

echo [2/8] Eliminando apps de terceros comunes...
powershell -Command "Get-AppxPackage *Netflix* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *Spotify* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *Disney* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *McAfee* | Remove-AppxPackage" 2>nul
powershell -Command "Get-AppxPackage *Norton* | Remove-AppxPackage" 2>nul
echo [OK] Apps de terceros eliminadas
echo.

echo [3/8] Desinstalando OneDrive...
:: Detener procesos
taskkill /F /IM OneDrive.exe >nul 2>&1
:: Desinstalar
if exist "%SystemRoot%\System32\OneDriveSetup.exe" (
    "%SystemRoot%\System32\OneDriveSetup.exe" /uninstall >nul 2>&1
)
if exist "%SystemRoot%\SysWOW64\OneDriveSetup.exe" (
    "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /uninstall >nul 2>&1
)
echo [OK] OneDrive desinstalado
echo.

echo [4/8] Eliminando Microsoft Teams (versión personal)...
powershell -Command "Get-AppxPackage *Teams* | Remove-AppxPackage" 2>nul
echo [OK] Teams eliminado
echo.

echo [5/8] Desactivando sugerencias de la Tienda Windows...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
echo [OK] Sugerencias de apps desactivadas
echo.

echo [6/8] Desactivando contenido promocional...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
echo [OK] Contenido promocional desactivado
echo.

echo [7/8] Desinstalando apps de publicidad...
powershell -Command "Get-AppxPackage *Microsoft.Advertising* | Remove-AppxPackage" 2>nul
echo [OK] Apps de publicidad eliminadas
echo.

echo [8/8] Limpiando archivos restantes...
rd /s /q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\OneDrive" 2>nul
echo [OK] Archivos residuales eliminados
echo.

echo ╔══════════════════════════════════════════════════════════════╗
echo ║         BLOATWARE ELIMINADO CON ÉXITO                        ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo Aplicaciones eliminadas:
echo   ✓ 3D Builder, Alarms, Mail/Calendar
echo   ✓ Office Hub, Skype, Get Started
echo   ✓ Groove Music, Maps, Solitaire
echo   ✓ Money, Movies, News, OneNote
echo   ✓ People, Phone, Sports, Voice Recorder
echo   ✓ Weather, Xbox app
echo   ✓ Netflix, Spotify, Disney+ (si estaban)
echo   ✓ OneDrive (desinstalado)
echo   ✓ Teams personal
echo.
echo NOTA: Puedes reinstalar cualquier app desde Microsoft Store.
echo.
echo Reinicia tu PC para completar el proceso.
echo.
pause