#!/bin/sh
#
docker build --no-cache=true -f Dockerfile . -t ucvm_1210_eight:12011955 --build-arg APP_UNAME=`id -u -nr` --build-arg APP_GRPNAME=`id -g -nr` --build-arg APP_UID=`id -u` --build-arg APP_GID=`id -g`
