@ECHO OFF
TITLE GoodbyeDPI - Steam Only
PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)
PUSHD "%_arch%"

echo =========================================================================
echo    GoodbyeDPI - Vietnam Edition (Chi mo chan Steam)
echo =========================================================================
echo  * Che do DPI  : -9 (Reverse fragmentation + Fake packets + Anti-QUIC)
echo  * DNS Resolver: Cloudflare DNS (1.1.1.1:53) chong DNS Poisoning
echo  * Danh sach   : vietnam-steam.txt (Chi xu ly luu luong Steam & Valve)
echo  * Khong anh huong den ping va toc do cua cac game hoac ung dung khac
echo =========================================================================
echo.
echo  Luu y: Vui long chay voi quyen Administrator (Run as Administrator).
echo  Giu cua so nay mo trong suot qua trinh su dung.
echo.

goodbyedpi.exe -9 --dns-addr 1.1.1.1 --dns-port 53 --dnsv6-addr 2606:4700:4700::1111 --dnsv6-port 53 --blacklist ..\vietnam-steam.txt

POPD
POPD
pause
