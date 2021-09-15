## ucvm_docker
This ucvm_docker repo contains scripts for running UCVM Docker Images and scripts for creating (building) UCVM Docker Images. The information about building UCVM docker images is not needed by most users.

## How to Run a UCVM Docker Image - Quickstart
UCVM Docker images contains UCVM software which can be run without a significant installation process. Users install the Docker client on their Laptops, and then use the Docker client software to run UCVM Docker images. Docker client software is available as a free software download for several operating systems including MacOS, Windows, and Linux.

1. Install Docker Client on User Computer and Start Docker Client
- Docker Client download from [Dockerhub](https://hub.docker.com)
- Increase Docker configuration to 2 CPUs and 50GB memory

2. Open a terminal window on your local computer, and create a directory where you will run UCVM.
- mkdir /Users/maechlin/ucvm_docker
- cd /Users/maechlin/ucvm_docker

3. Create a "target" directory where UCVM files are input/output
- cd /Users/maechlin/ucvm_docker
- mkdir target
- ls /Users/maechlin/ucvm_docker/target

4. Open a terminal window and start the UCVM Docker image using the docker run command below. The UCVM image will be downloaded from Dockerhub. The image is about 6GB so download time may be minutes or longer.
- docker run --rm -it --mount type=bind,source="$(pwd)"/target,destination=/app/target  ucvm_1210_cvms5:09131731

5. The images starts and users sees a Linux bash shell command line prompt as user "ucvm" in directory: /app/target
 
7. Run a ucvm_query test query
- $ucvm_query -f /app/ucvm/conf/ucvm.conf -m cvmh < /app/test_latlons.txt

8. Create your own test_latlons.txt in your "target" directory
- Files saved to "target" will be saved after container exits. So put any input or outputs in the "target" directory. 
- If you edit the /app/ucvm/conf/ucvm.conf file, since that file is in the container file system, file edits will be lost when the container exits.

## Motivation for Creating UCVM Docker Installations
SCEC's UCVM velocity model software is designed to run on Linux computers, and the software must be installed, compiled, and tested on the users system before routine use. We believe we can leverage computer virtualization to help users avoid the difficult UCVM installation process. This github repo contains codes and documents for a prototype version of UCVM distributed as docker images. 

## UCVM Docker Wiki-based Documentation
[UCVM Wiki Documentation](https://github.com/sceccode/ucvm_docker/wiki) The UCVM documentation is kept together with the source code in the git repo.

## Contents of Repo - UCVM Docker Versions
Each subdirectory in this UCVM repo contains a slightly different dockerized version of UCVM. As a result, the Dockerfiles used to construct the images are somewhat different. We recommend using only the most recent Docker images, created using scripts in ucvm_v21_10
## ucvm_v21_10
This is the most recent version of ucvm. It includes the base ucvm, plus one model per image. These images have been pushed to dockerhub and they are the preferred dockerized version. They do not include the python plotting libraries.
## miniucvm
This was the first containerized version of UCVM created by the group. It showed proof of concept and a working Dockerfile
## py3ucvm
This is the python3 version of ucvm in a docker container.

## Docker Client Software - Download
Docker is an open-source platform to build, ship, and run applications, whether on laptops, data center virtual machines, or the cloud with OS-level virtualization. 
- The official <a href="http://docs.docker.com">Docker documentation</a> 
- The <a href="https://docs.docker.com/engine/reference/commandline/images/">Docker images</a> to setup your docker installation and step through the quickstart guide.
  
## Current UCVM Docker Images on Dockerhub
1. ucvm_1210_cencal:09131731   9.04GB
2. ucvm_1210_wfcvm:09131731   6.44GB
3. sceccode/ucvm_1210_albacore:09131731   6.27GB
4. sceccode/ucvm_1210_cca:09131731   19.7GB
5. sceccode/ucvm_1210_cvlsu:09131731   6.27GB
6. sceccode/ucvm_1210_ivlsu:09131731   6.27GB
7. sceccode/ucvm_1210_cvms:09131731   6.27GB
8. sceccode/ucvm_1210_cvmh:09131731   9.94GB
9. sceccode/ucvm_1210_cvmsi:09131731   7.32GB
10. sceccode/ucvm_1210_cvms5:09131731   9.63G
