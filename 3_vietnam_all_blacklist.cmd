@ECHO OFF
TITLE GoodbyeDPI - Vietnam + Original Blacklist
PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)
PUSHD "%_arch%"

echo =========================================================================
echo    GoodbyeDPI - Vietnam Edition (Ban goc + Bo sung Viet Nam/Steam)
echo =========================================================================
echo  * Che do DPI  : -9 (Reverse fragmentation + Fake packets + Anti-QUIC)
echo  * DNS Resolver: Cloudflare DNS (1.1.1.1:53) chong DNS Poisoning
echo  * Danh sach   : 
echo      1. Danh sach goc GoodbyeDPI (154.000+ domain toan cau)
echo      2. Danh sach bo sung YouTube (russia-youtube.txt)
echo      3. Danh sach bo sung Viet Nam (Steam, Medium, BBC, ArtStation...)
echo =========================================================================
echo.
echo  Luu y: Vui long chay voi quyen Administrator (Run as Administrator).
echo  Giu cua so nay mo trong suot qua trinh su dung.
echo.

goodbyedpi.exe -9 --dns-addr 1.1.1.1 --dns-port 53 --dnsv6-addr 2606:4700:4700::1111 --dnsv6-port 53 --blacklist "%~dp0blacklist\russia-blacklist.txt" --blacklist "%~dp0blacklist\russia-youtube.txt" --blacklist "%~dp0blacklist\vietnam-all.txt"

POPD
POPD
pause
