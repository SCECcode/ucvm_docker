#!/bin/bash

git clone https://github.com/SCECcode/UCVMC.git -b forDocker 

mkdir -p $UCVM_INSTALL_PATH

cd $UCVM_SRC_PATH/largefiles
./get_large_files.py << EOF
y
n
n
n
n
n
n
n
EOF

cd $UCVM_SRC_PATH/largefiles; ./check_largefiles_md5.py
cd $UCVM_SRC_PATH/largefiles; ./stage_large_files.py

cd $UCVM_SRC_PATH
./ucvm_setup.py -d -a << EOF &> ucvm_setup_install.log
$UCVM_INSTALL_PATH
EOF

if [ -e $UCVM_SRC_PATH/bash_ucvm.sh ] then
  cp $UCVM_SRC_PATH/bash_ucvm.sh $UCVM_INSTALL_PATH/config
fi

cd $UCVM_SRC_PATH; make check

echo "..EXITING.."
exit
