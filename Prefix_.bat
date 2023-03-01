@echo off
setlocal enabledelayedexpansion

set "prefix="

echo Select files to add prefix to:
set "files="
for %%I in (.) do set "defaultFolder=%%~fI"
pushd "%defaultFolder%" && (
  set "filter="
  set "title=Select files to add prefix to"
  set "button=Add prefix"
  set "options="
  set "count=0"
  for /f "delims=" %%F in ('powershell.exe -noprofile "iex (${%~f0} | out-string)"') do (
    if "%%~F"=="<Break>" goto :cancel
    if defined files set "files=!files!,"
    set /a "count+=1"
    set "files=!files!"%%~F""
  )
  popd
)

if not defined files (
  echo No files selected.
  pause
  exit /b
)

set /p "prefix=Enter prefix: "

for %%F in (%files%) do (
  set "name=%%~nxF"
  ren "%%F" "!prefix!!name!"
)

echo Prefix added successfully.
pause
exit /b

:cancel
popd
echo User cancelled.
pause
exit /b
