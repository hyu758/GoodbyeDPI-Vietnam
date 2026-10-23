@ECHO OFF
TITLE GoodbyeDPI - Install Windows Service (All Websites)
PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)

echo =========================================================================
echo    Cai dat GoodbyeDPI thanh Windows Service (Mo chan TAT CA website)
echo =========================================================================
echo  Bat buoc chay file nay voi quyen Administrator (Run as Administrator).
echo  Service se tu dong chay ngam moi khi bat may tinh, khong can mo CMD.
echo.
echo  Nhan phim bat ky de bat dau cai dat...
pause >nul

sc stop "GoodbyeDPI" >nul 2>&1
sc delete "GoodbyeDPI" >nul 2>&1
sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -9 --dns-addr 1.1.1.1 --dns-port 53 --dnsv6-addr 2606:4700:4700::1111 --dnsv6-port 53" start= "auto"
sc description "GoodbyeDPI" "GoodbyeDPI Vietnam Edition - Tu dong vuot DPI va unblock tat ca website"
sc start "GoodbyeDPI"

echo.
echo =========================================================================
echo  Hoan tat! GoodbyeDPI da duoc cai dat thanh cong va dang chay ngam.
echo =========================================================================
POPD
pause
