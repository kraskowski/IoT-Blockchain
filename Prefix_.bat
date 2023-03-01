@echo off
setlocal EnableDelayedExpansion

REM Prompt the user to select files
set "files="
echo Please select files to rename:
echo.
set "vbsfile=%temp%\_.vbs"
>"%vbsfile%" echo set WshShell=WScript.CreateObject("WScript.Shell") 
>>"%vbsfile%" echo set oExec=WshShell.Exec("mshta.exe ""about:<input type=file id=FILE><script>FILE.click();new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).WriteLine(FILE.value);close();resizeTo(0,0);</script>""") 
>>"%vbsfile%" echo Do While oExec.Status = 0 : WScript.Sleep 100 : Loop 
>>"%vbsfile%" echo WScript.StdOut.WriteLine oExec.StdOut.ReadAll 
set "filelist=%temp%\_.filelist"
for /f "delims=" %%f in ('cscript //nologo "%vbsfile%"') do (
    set "file=%%~f"
    if defined file (
        set "files=!files! "%%~f""
        echo - "%%~f"
    )
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
