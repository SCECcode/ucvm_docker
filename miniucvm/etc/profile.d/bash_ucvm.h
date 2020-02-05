## base models are abb, path, tarball, model name
##       cvms/cvms/cvms4.tar.gz/CVM-S4
##       cvms5/cvms5/cvms5.tar.gz/CVM-S4.26
##       cvms426/cvmsi/cvms426.tar.gz/CVM-S4.26.M01
export UCVM_INSTALL_PATH=/app/UCVMC_TARGET

if [ -n "$LD_LIBRARY_PATH" ] ; then
  export LD_LIBRARY_PATH="${UCVM_INSTALL_PATH}/lib/euclid3/lib:${UCVM_INSTALL_PATH}/lib/proj-5/lib:${UCVM_INSTALL_PATH}/model/cvms/lib:${UCVM_INSTALL_PATH}/model/cvms5/lib:${UCVM_INSTALL_PATH}/model/cvms426/lib:${LD_LIBRARY_PATH}"
  else
    export LD_LIBRARY_PATH="${UCVM_INSTALL_PATH}/lib/euclid3/lib:${UCVM_INSTALL_PATH}/lib/proj-5/lib:${UCVM_INSTALL_PATH}/model/cvms/lib:${UCVM_INSTALL_PATH}/model/cvms5/lib:${UCVM_INSTALL_PATH}/model/cvms426/lib"
fi

## setup python script
if [ $PYTHONPATH ] ; then 
  export PYTHONPATH="${PYTHONPATH}:${UCVM_INSTALL_PATH}/utilities/pycvm"
  else
     export PYTHONPATH="${UCVM_INSTALL_PATH}/utilities/pycvm"
fi

export DYLD_LIBRARY_PATH="${UCVM_INSTALL_PATH}/lib/euclid3/lib:${UCVM_INSTALL_PATH}/lib/proj-5/lib:${UCVM_INSTALL_PATH}/model/cvms/lib:${UCVM_INSTALL_PATH}/model/cvms5/lib:${UCVM_INSTALL_PATH}/model/cvms426/lib"

if [ $PATH ] ; then
  export PATH="${UCVM_INSTALL_PATH}/bin:${PATH}"
  else
    export PATH="${UCVM_INSTALL_PATH}/bin"
fi
