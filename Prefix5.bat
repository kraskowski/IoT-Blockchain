@echo off
setlocal EnableDelayedExpansion

REM Use PowerShell to prompt user to select files
echo Please select the files to rename:
set "files="
for /f "delims=" %%f in ('powershell.exe -Command "Add-Type -AssemblyName System.Windows.Forms; $ofd = New-Object System.Windows.Forms.OpenFileDialog; $ofd.Multiselect = $true; $ofd.Filter = 'All files (*.*)|*.*'; $null = $ofd.ShowDialog(); $ofd.FileNames"') do (
  set "files=!files! "%%f""
)
if not defined files (
  echo No files selected.
  goto end
)

REM Prompt user for prefix
set /p prefix=Enter prefix:

REM Rename files with prefix
for %%f in (%files%) do (
  set "name=%%~nxf"
  set "dir=%%~dpf"
  ren "%%f" "%prefix%!name!"
)

echo Done!
: end
pause
