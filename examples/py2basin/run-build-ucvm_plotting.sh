#!/bin/bash

cd $UCVM_SRC_PATH/..
git clone https://github.com/SCECcode/ucvm_plotting.git

cd ucvm_plotting
./unpack-dist &> unpack-dist.log

echo "..ucvm_plotting build, EXITING.."
