import os
import subprocess
import re

winmac = '10:60:4B:76:66:1E'
o = subprocess.run(['wakeonlan', winmac])
print(o)

# r = subprocess.run(['arp', '-a'], capture_output=True)

# ip = re.compile('192\.\d\d\d\.1\.\d+')
# mac = re.compile('([0-9a-fA-F][0-9a-fA-F]:){5}([0-9a-fA-F][0-9a-fA-F])')

# for line in r.stdout.decode('utf-8').split('\n'):
#     s = line.split(' ')
#     print(s)
#     if len(s)>2:
#         o = subprocess.run(['wakeonlan', s[3]])
#         print(o, s[3])

