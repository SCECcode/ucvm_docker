#!/usr/bin/env python2
import sys
import os
import time
#
# Generate the master out.grid
# Create a 3M point file of lat/lons - and write to ASCII file called out.grd.
# This file will be used as input to ucvm_query for medium scale test for images
#
if not os.path.exists("out.grd"):
  print "Creating grd.out file."
  cmd="/app/ucvm/utilities/makegrid"
  print cmd
  os.system(cmd)
#
# Call each of the installed crustal models and time how
# long it takes to populate the models
#
#
# model bbp1d
#
start = time.time()
model_string = "bbp1d"
cmd="ucvm_query -f /app/ucvm/conf/ucvm.conf -m %s < out.grd > mesh_%s.out"%(model_string,model_string)
print cmd
os.system(cmd)
end = time.time()
print "Mesh extraction for model %s : %d seconds"%(model_string,(end-start))
#
#
# model 1d
#
start = time.time()
model_string = "1d"
cmd="/app/ucvm/bin/ucvm_query -f /app/ucvm/conf/ucvm.conf -m %s < out.grd > mesh_%s.out"%(model_string,model_string)
print cmd
os.system(cmd)
end = time.time()
print "Mesh extraction for model %s : %d seconds"%(model_string,(end-start))
#
# model CVM-S4
#
start = time.time()
model_string = "cvms"
cmd="/app/ucvm/bin/ucvm_query -f /app/ucvm/conf/ucvm.conf -m %s < out.grd > mesh_%s.out"%(model_string,model_string)
print cmd
os.system(cmd)
end = time.time()
print "Mesh extraction for model %s : %d seconds"%(model_string,(end-start))
#
# model CVM-S4.26
#
start = time.time()
model_string = "cvms5"
cmd="/app/ucvm/bin/ucvm_query -f /app/ucvm/conf/ucvm.conf -m %s < out.grd > mesh_%s.out"%(model_string,model_string)
print cmd
os.system(cmd)
end = time.time()
print "Mesh extraction for model %s : %d seconds"%(model_string,(end-start))
#
# model CVM-S4.26.M01
#
start = time.time()
model_string = "cvmsi"
cmd="/app/ucvm/bin/ucvm_query -f /app/ucvm/conf/ucvm.conf -m %s < out.grd > mesh_%s.out"%(model_string,model_string)
print cmd
os.system(cmd)
end = time.time()
print "Mesh extraction for model %s : %d seconds"%(model_string,(end-start))
#
# model CVM-H v15.1
#
start = time.time()
model_string = "cvmh"
cmd="/app/ucvm/bin/ucvm_query -f /app/ucvm/conf/ucvm.conf -m %s < out.grd > mesh_%s.out"%(model_string,model_string)
print cmd
os.system(cmd)
end = time.time()
print "Mesh extraction for model %s : %d seconds"%(model_string,(end-start))
#
# model albacore
#
start = time.time()
model_string = "albacore"
cmd="/app/ucvm/bin/ucvm_query -f /app/ucvm/conf/ucvm.conf -m %s < out.grd > mesh_%s.out"%(model_string,model_string)
print cmd
os.system(cmd)
end = time.time()
print "Mesh extraction for model %s : %d seconds"%(model_string,(end-start))
#
# model cca
#
start = time.time()
model_string = "cca"
cmd="/app/ucvm/bin/ucvm_query -f /app/ucvm/conf/ucvm.conf -m %s < out.grd > mesh_%s.out"%(model_string,model_string)
print cmd
os.system(cmd)
end = time.time()
print "Mesh extraction for model %s : %d seconds"%(model_string,(end-start))
#
# model ivlsu
#
start = time.time()
model_string = "ivlsu"
cmd="/app/ucvm/bin/ucvm_query -f /app/ucvm/conf/ucvm.conf -m %s < out.grd > mesh_%s.out"%(model_string,model_string)
print cmd
os.system(cmd)
end = time.time()
print "Mesh extraction for model %s : %d seconds"%(model_string,(end-start))

#
# model cvlsu
#
start = time.time()
model_string = "cvlsu"
cmd="/app/ucvm/bin/ucvm_query -f /app/ucvm/conf/ucvm.conf -m %s < out.grd > mesh_%s.out"%(model_string,model_string)
print cmd
os.system(cmd)
end = time.time()
print "Mesh extraction for model %s : %d seconds"%(model_string,(end-start))
sys.exit(0)
