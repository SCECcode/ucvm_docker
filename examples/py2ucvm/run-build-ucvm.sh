#!/bin/bash

git clone https://github.com/SCECcode/ucvm.git

mkdir -p $UCVM_INSTALL_PATH

cd $UCVM_SRC_PATH/largefiles
./get_largefiles.py << EOF
n
n
n
n
n
n
n
y
n
n
n
n
EOF

cd $UCVM_SRC_PATH/largefiles; ./check_largefiles_md5.py
cd $UCVM_SRC_PATH/largefiles; ./stage_largefiles.py

cd $UCVM_SRC_PATH
./ucvm_setup.py -d -a << EOF &> ucvm_setup_install.log
$UCVM_INSTALL_PATH
EOF

cd $UCVM_SRC_PATH/..
git clone https://github.com/SCECcode/ucvm_plotting.git

echo "..EXITING.."
