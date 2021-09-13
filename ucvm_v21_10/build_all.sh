#!/bin/sh
cp ./models/cvms5.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_cvms5:09131139
rm ./ucvm/largefiles/cvms5.tar.gz
#
cp ./models/cvmsi.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_cvmsi:09131139
rm ./ucvm/largefiles/cvmsi.tar.gz 
#
cp ./models/cvmh.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_cvmh:09131139
rm ./ucvm/largefiles/cvmh.tar.gz 
#
cp ./models/cvms.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_cvms:09131139
rm ./ucvm/largefiles/cvms.tar.gz 
#
cp ./models/ivlsu.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_ivlsu:09131139
rm ./ucvm/largefiles/ivlsu.tar.gz 
#
cp ./models/cvlsu.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_cvlsu:09131139
rm ./ucvm/largefiles/cvlsu.tar.gz 
#
cp ./models/cca.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_cca:09131139
rm ./ucvm/largefiles/cca.tar.gz 
#
cp ./models/albacore.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_albacore:09131139
rm ./ucvm/largefiles/albacore.tar.gz 
#
cp ./models/wfcvm.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_wfcvm:09131139
rm ./ucvm/largefiles/wfcvm.tar.gz
#
cp ./models/cencal.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_cencal:09131139
rm ./ucvm/largefiles/cencal.tar.gz
#
