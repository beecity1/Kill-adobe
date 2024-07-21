@echo off
setlocal enableextensions

REM Define directories to operate on
set "dirs=C:\ProgramData\Adobe;C:\Program Files\Adobe;C:\Program Files\Common Files\Adobe;C:\Program Files (x86)\Adobe;C:\Program Files (x86)\Common Files;C:\Users\user\AppData\Local\Adobe"

REM Loop through each directory
for %%d in (%dirs%) do (
    if exist "%%d\" (
        pushd "%%d"
        echo Processing directory: %%d
        for /R %%a in (*.exe) do (
            echo Adding firewall rule for %%a
            netsh advfirewall firewall add rule name="Blocked with Batchfile %%a" dir=out program="%%a" action=block
        )
        popd
    ) else (
        echo Directory does not exist: %%d
    )
)

echo Done processing all directories.
endlocal
