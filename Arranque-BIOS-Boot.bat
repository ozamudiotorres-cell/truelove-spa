@echo off
setlocal EnableExtensions

:: ============================================================
::  Arranque-BIOS-Boot.bat   (PORTABLE)
::  Reinicia / apaga el equipo directamente a la BIOS/UEFI o al
::  menu de arranque en 3 segundos. Auto-eleva permisos (UAC).
::
::  100%% portable: un solo archivo. Copialo a un USB o a
::  cualquier carpeta y ejecutalo. No usa rutas fijas: se
::  referencia a si mismo con %%~f0, asi que funciona en
::  cualquier Windows (8/8.1/10/11) y desde cualquier ubicacion.
:: ============================================================

:: ---------- Auto-elevacion a Administrador ----------
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Solicitando permisos de administrador...
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

:: Trabajar siempre desde la carpeta del propio script
cd /d "%~dp0"

:MENU
cls
echo ============================================================
echo            ARRANQUE A BIOS / MENU DE ARRANQUE
echo                      (version portable)
echo ============================================================
echo.
echo   [1] Reiniciar a la BIOS/UEFI          (en 3 segundos)
echo   [2] Reiniciar al MENU DE ARRANQUE      (en 3 segundos)
echo       (Opciones de inicio avanzadas: USB, red, firmware)
echo   [3] APAGAR e ir a la BIOS al encender  (en 3 segundos)
echo   [4] Cancelar reinicio/apagado programado
echo   [5] Crear acceso directo en el Escritorio de ESTE equipo
echo   [0] Salir
echo.
echo ============================================================
set "OPC="
set /p "OPC=Elige una opcion y pulsa ENTER: "

if "%OPC%"=="1" goto BIOS
if "%OPC%"=="2" goto BOOTMENU
if "%OPC%"=="3" goto APAGARBIOS
if "%OPC%"=="4" goto CANCELAR
if "%OPC%"=="5" goto CREARACCESO
if "%OPC%"=="0" exit /b
goto MENU

:BIOS
echo.
echo Reiniciando a la BIOS/UEFI en 3 segundos...
:: /r reiniciar  /fw arrancar a la interfaz de firmware (solo UEFI)  /t tiempo
shutdown /r /fw /t 3
if %errorlevel% neq 0 (
    echo.
    echo [!] No se pudo programar el arranque a firmware UEFI.
    echo     Posibles causas: el equipo usa BIOS Legacy ^(no UEFI^)
    echo     o el firmware no soporta esta funcion.
    echo.
    pause
    goto MENU
)
echo Listo. El equipo se reiniciara a la BIOS.
goto FIN

:BOOTMENU
echo.
echo Reiniciando al menu de arranque en 3 segundos...
:: /r reiniciar  /o abrir Opciones de inicio avanzadas  /t tiempo
shutdown /r /o /t 3
echo.
echo Tras reiniciar elige: Usar un dispositivo (USB/red) o
echo Solucionar problemas ^> Opciones avanzadas ^> Configuracion
echo de firmware UEFI.
goto FIN

:APAGARBIOS
echo.
echo Apagando en 3 segundos. Al volver a encender entrara a la BIOS/UEFI...
:: /s apagar  /fw arrancar a firmware en el proximo encendido  /t tiempo
shutdown /s /fw /t 3
if %errorlevel% neq 0 (
    echo.
    echo [!] No se pudo programar el apagado a firmware UEFI.
    echo     Posibles causas: el equipo usa BIOS Legacy ^(no UEFI^)
    echo     o el firmware no soporta esta funcion.
    echo.
    pause
    goto MENU
)
echo Listo. El equipo se apagara y entrara a la BIOS al encender.
goto FIN

:CANCELAR
echo.
shutdown /a >nul 2>&1
if %errorlevel% equ 0 (
    echo Reinicio/apagado programado CANCELADO.
) else (
    echo No habia ningun reinicio/apagado programado.
)
echo.
pause
goto MENU

:CREARACCESO
echo.
echo Creando acceso directo en el Escritorio de este equipo...
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$t='%~f0';" ^
  "$d=[Environment]::GetFolderPath('Desktop');" ^
  "$l=Join-Path $d 'BIOS - Boot Menu.lnk';" ^
  "$w=New-Object -ComObject WScript.Shell;" ^
  "$s=$w.CreateShortcut($l);" ^
  "$s.TargetPath=$t;" ^
  "$s.WorkingDirectory=Split-Path $t;" ^
  "$s.IconLocation=\"$env:SystemRoot\System32\imageres.dll,109\";" ^
  "$s.Description='Reiniciar a la BIOS/UEFI o al menu de arranque';" ^
  "$s.Save();" ^
  "$b=[IO.File]::ReadAllBytes($l); $b[0x15]=$b[0x15] -bor 0x20; [IO.File]::WriteAllBytes($l,$b);" ^
  "Write-Host ('Creado: '+$l)"
echo.
echo Nota: el acceso directo apunta a la ubicacion ACTUAL de este
echo archivo. Si mueves el .bat, vuelve a crear el acceso directo.
echo.
pause
goto MENU

:FIN
timeout /t 4 >nul
exit /b
