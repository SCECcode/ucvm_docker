#!/bin/sh
cp ../../ucvm/largefiles/cvms5.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_cvms5:11071611
rm ./ucvm/largefiles/cvms5.tar.gz
#
cp ../../ucvm/largefiles/cvmsi.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_cvmsi:11071611
rm ./ucvm/largefiles/cvmsi.tar.gz
#
cp ../../ucvm/largefiles/cvmh.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_cvmh:11071611
rm ./ucvm/largefiles/cvmh.tar.gz
#
cp ../../ucvm/largefiles/cvms.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_cvms:11071611
rm ./ucvm/largefiles/cvms.tar.gz
#
cp ../../ucvm/largefiles/ivlsu.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_ivlsu:11071611
rm ./ucvm/largefiles/ivlsu.tar.gz
#
cp ../../ucvm/largefiles/cvlsu.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_cvlsu:11071611
rm ./ucvm/largefiles/cvlsu.tar.gz
#
cp ../../ucvm/largefiles/cca.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_cca:11071611
rm ./ucvm/largefiles/cca.tar.gz
#
cp ../../ucvm/largefiles/albacore.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_albacore:11071611
rm ./ucvm/largefiles/albacore.tar.gz
#
cp ../../ucvm/largefiles/wfcvm.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_wfcvm:11071611
rm ./ucvm/largefiles/wfcvm.tar.gz
#
cp ../../ucvm/largefiles/cencal.tar.gz ./ucvm/largefiles/.
docker build . -f Dockerfile --no-cache=true -t ucvm_1210_cencal:11071611
rm ./ucvm/largefiles/cencal.tar.gz
