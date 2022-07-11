#!/usr/bin/env python3
f = open('inputs.txt','r')
inf = f.readline()
pts = inf.split()
lon1 = pts[0]
lat1 = pts[1]
for x in range(0,1000,1):
  print(lon1 + " " + lat1 + " " + str(x))

