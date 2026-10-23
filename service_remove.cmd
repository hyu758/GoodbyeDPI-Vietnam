@ECHO OFF
TITLE GoodbyeDPI - Remove Windows Service
echo =========================================================================
echo    Go bo Windows Service GoodbyeDPI
echo =========================================================================
echo  Bat buoc chay file nay voi quyen Administrator (Run as Administrator).
echo.
echo  Nhan phim bat ky de bat dau go bo service...
pause >nul

sc stop "GoodbyeDPI" >nul 2>&1
sc delete "GoodbyeDPI" >nul 2>&1
sc stop "WinDivert" >nul 2>&1
sc delete "WinDivert" >nul 2>&1
sc stop "WinDivert14" >nul 2>&1
sc delete "WinDivert14" >nul 2>&1

echo.
echo =========================================================================
echo  Da go bo service va driver WinDivert thanh cong!
echo =========================================================================
pause
