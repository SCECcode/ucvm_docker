#!/bin/sh
#
cp ../../ucvm/largefiles/cvms5.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_cvms5:09122303
rm ./ucvm/largefiles/cvms5.tar.gz 
