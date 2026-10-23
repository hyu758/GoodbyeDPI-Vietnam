@ECHO OFF
TITLE GoodbyeDPI - All Websites
PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)
PUSHD "%_arch%"

echo =========================================================================
echo    GoodbyeDPI - Vietnam Edition (Mo chan TAT CA website)
echo =========================================================================
echo  * Che do DPI  : -9 (Reverse fragmentation + Fake packets + Anti-QUIC)
echo  * DNS Resolver: Cloudflare DNS (1.1.1.1:53) chong DNS Poisoning
echo  * Pham vi     : Tat ca website tren the gioi (khong can blacklist)
echo =========================================================================
echo.
echo  Luu y: Vui long chay voi quyen Administrator (Run as Administrator).
echo  Giu cua so nay mo trong suot qua trinh su dung.
echo.

goodbyedpi.exe -9 --dns-addr 1.1.1.1 --dns-port 53 --dnsv6-addr 2606:4700:4700::1111 --dnsv6-port 53

POPD
POPD
pause
