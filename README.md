# ucvm_docker

## Docker

Docker is an open-source platform to build, ship, and run applications, whether on laptops, data center virtual machines, or the cloud with OS-level virtualization. 

* The official <a href="http://docs.docker.com">Docker documentation</a> 
* The <a href="https://docs.docker.com/engine/reference/commandline/images/">Docker images</a> to setup your docker installation and step through the quickstart guide.

## Contents of Repo
Each subdirectory in this UCVM repo contains a slightly different dockerized version of UCVM. As a result, the Dockerfiles used to construct the images are somewhat different. We recommend using only the most recent Docker images, created using scripts in ucvm_v21_10

## ucvm_v21_10
This is the most recent version of ucvm. It includes the base ucvm, plus one model per image. These images have been pushed to dockerhub and they are the preferred dockerized version. They do not include the python plotting libraries.

## miniucvm
This was the first containerized version of UCVM created by the group. It showed proof of concept and a working Dockerfile

## py3ucvm
This is the python3 version of ucvm in a docker container.

## Motivation for Creating UCVM Docker Installations
SCEC's UCVM velocity model software is designed to run on Linux computers, and the software must be installed, compiled, and tested on the users system before routine use.

We believe we can leverage computer virtualization to help users avoid the difficult UCVM installation process. This github repo contains codes and documents for a prototype version of UCVM distributed as docker images. 

## Seismic Velocity Models Available
Fourteen models are avialable through UCVM for various regions, most in southern California, some regions quite small, one offshore, one in Utah. We have package the 3D models individually. In each Docker image, the primary CVM is provided, as well as two 1D models. The UCVM software can tile 3D models with 1D models to increase their coverage region. Users are expected to install one Docker image for each seismic velocity model.

## UCVM Docker Image Usage Model
The UCVM Docker image gives usages a command line access to the program: ucvm_query
* Inputs:
** List of lat/lon/depth values
** Path to configuration file
** Model abbreviation
* Outputs:
** List of lat/lon/depth values with vp, vs, density from model added for each point

## Running UCVM using Docker on Mac/PC/Linux
* User starts docker on their computer
* User start ucvm_xxxx container on their computer
* In the directory where they started the container, they will use a subdirectory call /target.
* The container will read input files, and write results to this directory
* $cd /app/target
* $ucvm_query -f /app/ucvm/conf/ucvm.conf -m cvmh < /app/test_latlons.txt

## Potential Benefits to Research using UCVM Docker Images
* Full UCVM software installation is not needed. Downloading UCVM Docker images is simple.
* UCVM software is now portable to previously unsupported operating systems including Mac and Windows.
* Docker images with individual models require less disk space on users computers. Users can retreieve, usem remove images easily.

## Potential Limitations
* Users must be comfortable running ucvm from a command line interface. This over means they are creating output files, and extracting selected information for plotting.
* Users must work within limits of images and local computers. There are some ucvm problems, such as creating simulation meshes, that won't run on laptops. So users need to understand large-scale usage will probably require installation of UCVM on Linux systems with MPI.
* UCVM is used on supercomputers, for example, to build simulation meshes. The docker version of UCVM may not work for this purpose. There may be a query limit on number of inputs points that an image can query.

## Run Cmd:
docker run --rm -it --mount type=bind,source="$(pwd)"/target,destination=/app/target  sceccode/ucvm_<modelname>:MMDDHHMM

This is a coding and configuration test for creating a UCVM docker image that can be run on AWS.

## .dockerignore file
There is a .dockerignore file that defines which files not to include in the image. The Dockerfile and this README.md are excluded.

## Build Docker images for Nine SCEC CVMs
The top level script is: build_all.sh which invokes docker build 9 times, one for each model that we distribution in a docker image.
This script moves the model .gz file into the largefiles directory, then runs the build.

## Dockerfile
This lists the steps needed to build the container. It starts with a amazonlinux base image, add compilers and python.

It copies the ucvm git repo from the build computer into the image, and then invokes the build process. The build process runs, installs results in a directory: /app/ucvm

As the docker build concludes, the Dockerfile commands removed the source files, leaving only the binary files and the model files for the selected model.

## Current list of supported CVM models include:
<pre>
(base) maechlin@Philip-James-MacBook mydocker % docker images
REPOSITORY      TAG        IMAGE ID       CREATED       SIZE
ucvm_wfcvm      07021555   bc26446c9684   4 hours ago   4.59GB
ucvm_albacore   07021555   9a23c0a2253c   5 hours ago   4.42GB
ucvm_cca        07021555   49ef146b410b   5 hours ago   17.8GB
ucvm_cvlsu      07021555   c2e258787455   5 hours ago   4.42GB
ucvm_ivlsu      07021555   b87f75d2a284   5 hours ago   4.42GB
ucvm_cvms       07021555   82014646db4d   5 hours ago   6.29GB
ucvm_cvmh       07021555   23a7acc5c02f   5 hours ago   8.09GB
ucvm_cvmsi      07021555   13b617bc0030   5 hours ago   8.72GB
ucvm_cvms5      07021555   c512877403ed   5 hours ago   7.78GB
</pre>
