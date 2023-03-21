@echo off

set ip=%1
set state=0

echo Monitoring %ip%...

:loop
ping -n 1 %ip% >nul
if %errorlevel% == 0 (
    if %state% == 0 (
        set state=1
        echo %time%,%ip%,up.
    )
) else (
    if %state% == 1 (
        set state=0
        echo %time%,%ip%,down.
    )
)
goto loop
