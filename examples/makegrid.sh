#!/bin/sh
#
# Creates and ASCII grid file with 
# file grd.out
#
HOR_SPACING=0.0001
VERT_SPACING=10
MIN_DEPTH=90
MAX_DEPTH=110
MIN_LON=-118.5
MAX_LON=-117.5
MIN_LAT=33.5
MAX_LAT=34.5

rm -f out.grd

echo "Generating grid"

for z in `seq ${MIN_DEPTH} ${VERT_SPACING} ${MAX_DEPTH}`; do \
 for y in `seq ${MIN_LAT} ${HOR_SPACING} ${MAX_LAT}`; do \
  for x in `seq ${MIN_LON} ${HOR_SPACING} ${MAX_LON}`; do \
   echo $x $y $z >> out.grd; \
  done; \
 done; \
done;

echo "Done"
