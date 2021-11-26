#!/bin/sh
#
cp ../../ucvm/largefiles/cvms5.tar.gz ./ucvm/largefiles/.
docker build --no-cache=true -f Dockerfile . -t ucvm_1210_cvms5:11242320 --build-arg APP_UNAME=`id -u -nr` --build-arg APP_GRPNAME=`id -g -nr` --build-arg APP_UID=`id -u` --build-arg APP_GID=`id -g`
rm ./ucvm/largefiles/cvms5.tar.gz 
