#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import requests
import time

# Change to your Terrarium PI IP
s = requests.get('http://192.168.8.131:8090/api/sensors')
u = requests.get('http://192.168.8.131:8090/api/uptime')
sensors = s.json()
upt = u.json()

# This depends on your sensors number, mostly edit only number in brackets[x]
t0 = round(sensors['sensors'][0]['current'], 1)
t0n = sensors['sensors'][0]['name']
t1 = round(sensors['sensors'][1]['current'], 1)
t1n = sensors['sensors'][1]['name']
t2 = round(sensors['sensors'][2]['current'], 1)
t2n = sensors['sensors'][2]['name']
h0 = round(sensors['sensors'][3]['current'], 1)
h0n = sensors['sensors'][3]['name']

# Convert uptime to more friendly format
time = float(upt['uptime'])
day = time // (24 * 3600)
time = time % (24 * 3600)
hour = time // 3600
time %= 3600
minutes = time // 60
time %= 60

# Print everything
print("{}: {}°C".format(t0n, t0))
print("{}: {}°C".format(t1n, t1))
print("{}: {}°C".format(t2n, t2))
print("{}: {}%".format(h0n, h0))
print("Uptime: %dD %dH %dM" % (day, hour, minutes))
