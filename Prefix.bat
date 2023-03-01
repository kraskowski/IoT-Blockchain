@echo off
setlocal enabledelayedexpansion

REM Open file selection dialog
set "files="
for %%i in (.) do set "defaultFolder=%%~fi"
set "dialog=%SystemRoot%\System32\WScript.exe //nologo %SystemRoot%\System32\%~n0.vbs"
for /f "delims=" %%i in ('%dialog% "%defaultFolder%" "Select Files" "All Files|*.*|Text Files|*.txt;*.log" /multiselect') do (
  if not defined files (set "files=%%i") else (set "files=!files!;"%%i"")
)

REM Ask for prefix
set /p prefix=Enter prefix:

REM Add prefix to file names
for %%i in (%files%) do (
  set "filename=%%i"
  for /f "delims=" %%j in ("!filename!") do (
    ren "%%~j" "%prefix%%%~nxj"
  )
)

echo Prefix added to file names.
pause
