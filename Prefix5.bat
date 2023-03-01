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
    goto :eof
)

REM Prompt the user to enter the prefix
set /p "prefix=Enter a prefix: "

REM Rename the files with the prefix
for %%f in (%files%) do (
    set "filename=%%~nxf"
    ren "%%~f" "%prefix%!filename!"
)

echo Files renamed with prefix "%prefix%".

pause
