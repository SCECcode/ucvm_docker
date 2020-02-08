# ucvm_docker

## Docker

Docker is an open-source platform to build, ship, and run applications, whether on laptops, data center virtual machines, or the cloud with OS-level virtualization. 

Please read the official <a href="http://docs.docker.com">Docker documentation</a> 
and specifically the <a href="https://docs.docker.com/engine/reference/commandline/images/">Docker images</a> to setup your docker installation and step through the quickstart guide.

## miniucvm specification

*  UCVMC v19.4  https://github.com/SCECcode/UCVMC
*  Anaconda2 (conda 4.8.2, python 2.7.16)
*  Included CVMs: CVM-S4, CVM-S4.26, CVM-S4.26M01

## Running miniucvm

### Start a bash session

    mkdir target
    docker run --rm -it --mount type=bind,source="$(pwd)"/target,destination=/app/target  sceccode/miniucvm:1.0

### Test ucvm

    cp ../examples/*.sh .
    chmod og+x *.sh
    ./run-ucvm-plot.sh
    ./run-ucvm-query.sh
    exit


