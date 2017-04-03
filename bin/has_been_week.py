import datetime
import sys

log = '/Users/damca/git/backup.log'

with open(log) as lg:
    for line in lg:
        pass
    last = line

pre, time = last.split('git')
time = time.strip()
dt = datetime.datetime.strptime(time, '%d.%m.%y-%H:%M:%S')
now = datetime.datetime.now()
week = datetime.timedelta(days=3)

if now - dt < week:
    sys.exit(1)
