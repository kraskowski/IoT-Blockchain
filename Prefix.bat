@echo off
set /p prefix=Enter prefix:
powershell.exe -Command "& {$f=Get-ChildItem -Path . -Filter *.txt -File | Select-Object -ExpandProperty FullName; $f -join [Environment]::NewLine}" > files.txt
setlocal EnableDelayedExpansion
set files=
for /f "delims=" %%f in (files.txt) do set files=!files! "%%f"
for %%f in (%files%) do (
  set "name=%%~nxf"
  set "dir=%%~dpf"
  ren "%%f" "%prefix%!name!"
)
del files.txt
echo Done!
pause
