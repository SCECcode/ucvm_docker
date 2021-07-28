#!/bin/sh
cp ./models/cvms5.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_cvms5:07021555
rm ./ucvm/largefiles/cvms5.tar.gz
#
cp ./models/cvmsi.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_cvmsi:07021555
rm ./ucvm/largefiles/cvmsi.tar.gz 
#
cp ./models/cvmh.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_cvmh:07021555
rm ./ucvm/largefiles/cvmh.tar.gz 
#
cp ./models/cvms.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_cvms:07021555
rm ./ucvm/largefiles/cvms.tar.gz 
#
cp ./models/ivlsu.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_ivlsu:07021555
rm ./ucvm/largefiles/ivlsu.tar.gz 
#
cp ./models/cvlsu.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_cvlsu:07021555
rm ./ucvm/largefiles/cvlsu.tar.gz 
#
cp ./models/cca.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_cca:07021555
rm ./ucvm/largefiles/cca.tar.gz 
#
cp ./models/albacore.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_albacore:07021555
rm ./ucvm/largefiles/albacore.tar.gz 
#
cp ./models/wfcvm.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_wfcvm:07021555
rm ./ucvm/largefiles/wfcvm.tar.gz 
