import datetime
import sys

log = sys.argv[1]

with open(log) as lg:
    for line in lg:
        pass
    last = line

try:
    pre, time = last.split('on: ')
    time = time.strip()
    dt = datetime.datetime.strptime(time, '%d.%m.%y-%H:%M:%S')
    now = datetime.datetime.now()
    week = datetime.timedelta(days=3)
    print('Most recent backup: ', dt)
    print('Time delta: ', now - dt)
except ValueError:
    print('No valid log entry in {}'.format(log))
    print('Assuming more than week has pased...')

if now - dt < week:
    sys.exit(1)
