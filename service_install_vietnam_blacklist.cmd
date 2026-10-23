@ECHO OFF
TITLE GoodbyeDPI - Install Service (Original + Vietnam Supplement)
PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)

echo =========================================================================
echo    Cai dat GoodbyeDPI Windows Service (Ban goc + Bo sung Viet Nam)
echo =========================================================================
echo  Bat buoc chay file nay voi quyen Administrator (Run as Administrator).
echo  Service se tu dong chay ngam moi khi bat may tinh, khong can mo CMD.
echo.
echo  Pham vi ap dung:
echo    - 154.000+ domain goc (russia-blacklist.txt)
echo    - YouTube (russia-youtube.txt)
echo    - Bo sung Viet Nam: Steam, Medium, BBC... (vietnam-all.txt)
echo.
echo  Nhan phim bat ky de bat dau cai dat...
pause >nul

sc stop "GoodbyeDPI" >nul 2>&1
sc delete "GoodbyeDPI" >nul 2>&1
sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -9 --dns-addr 1.1.1.1 --dns-port 53 --dnsv6-addr 2606:4700:4700::1111 --dnsv6-port 53 --blacklist \"%CD%\blacklist\russia-blacklist.txt\" --blacklist \"%CD%\blacklist\russia-youtube.txt\" --blacklist \"%CD%\blacklist\vietnam-all.txt\"" start= "auto"
sc description "GoodbyeDPI" "GoodbyeDPI Vietnam Edition - Danh sach goc + Bo sung Viet Nam"
sc start "GoodbyeDPI"

echo.
echo =========================================================================
echo  Hoan tat! GoodbyeDPI da duoc cai dat thanh cong va dang chay ngam.
echo =========================================================================
POPD
pause
