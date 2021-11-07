[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
![GitHub repo size](https://img.shields.io/github/repo-size/sceccode/ucvm_docker)

## The Unified Community Velocity Model (UCVM) Docker Images

<a href="http://www.scec.org/research"><img src="https://github.com/sceccode/ucvm_docker/wiki/images/ucvm_docker_logo.png"></a>

## Description: 
The SCEC Unified Community Velocity Model (UCVM) software framework is a collection of software tools that provide a standard query interface to seismic velocity models. Once a seismic velocity model is registered into UCVM, it can be queried and combined with other velocity models through the UCVM software interface.

UCVM was developed as an interdisciplinary research collaboration involving geoscientists and computer scientists. UCVM geoscience research includes identification and assembly of existing California velocity models into a state-wide model and improvements to existing velocity models. UCVM computer science research includes definition of a easy-to-use CVM query interface, integration of regional 3D and geotechnical models, and automated CVM evaluation processing capabilities.

UCVM is open-source scientific software designed to support earth scientists, civil engineers, and other groups interested in detailed information about earth properties. UCVM is primarily used by scientists to work with earth material properties on regional scales. One important use of UCVM is to create simulation meshes used in high resolution 3D wave propagation simulations.

## Table of Contents:
1. [Software Documentation](https://github.com/SCECcode/ucvm_docker/wiki)
2. [Installation](#installation)
3. [Usage](#usage)
4. [Contributing](#contributing)
5. [Credits](#credit)
6. [License](#license)

## UCVM Installation Options:
UCVM was developed to support seismic simulations run on high-performance computing systems, so it is designed to compile and run on Linux-based computers. Before installing UCVM, they should be aware that there are several ways to get access to UCVM without installing the software on your own Linux computer. Below we outline several of the options:
1. [SCEC UCVM Web viewer:](http://moho.scec.org/UCVM_web/web/viewer.php) Users can query UCVM velocity models, without installing UCVM, using the UCVM website. 
2. [UCVM Docker Images](https://github.com/sceccode/ucvm_docker) Users can run UCVM in Docker on their local computers including laptops. Users can install free Docker software on most computers (e.g. Linux, MacOS, Windows) then run an UCVM Docker image in a terminal window on their computer. 
3.  [Installation Instructions for Linux Systems:](https://github.com/sceccode/ucvm/wiki) User can install UCVM on Linux system. Advanced users that want to install many of the UCVM models, or that want to run large parallel queries of the CVM models, should install the UCVM software on a Linux system. UCVM software is developed on USC Center for Advanced Research Computing (CARC) Linux cluster which provide MPI libraries. The UCVM software framework has several MPI-based executables. These executables are built using the automake system if the required MPI libraries are found in the installation computing environment. 

## Usage:
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
- docker run --rm -it --mount type=bind,source="$(pwd)"/target,destination=/app/target  sceccode/ucvm_1210_cvms5:09131731

5. The images starts and users sees a Linux bash shell command line prompt as user "ucvm" in directory: /app/target
 
7. Run a ucvm_query test query
- $ucvm_query -f /app/ucvm/conf/ucvm.conf -m cvmh < /app/test_latlons.txt

8. Create your own test_latlons.txt in your "target" directory
- Files saved to "target" will be saved after container exits. So put any input or outputs in the "target" directory. 
- If you edit the /app/ucvm/conf/ucvm.conf file, since that file is in the container file system, file edits will be lost when the container exits.

Once installed, UCVM provides an executable program, called ucvm_query, that implements a query interface to multiple seismic velocity models.

## Support:
Support for UCVM docker images is provided by that Southern California Earthquake Center (SCEC) Research Computing Group. This group supports several research software distributions including UCVM. Users can report issues and feature requests using UCVM's github-based issue tracking link below. Developers will also respond to emails sent to the SCEC software contact listed below.
1. [UCVM Docker Github Issue Tracker:](https://github.com/SCECcode/ucvm_docker/issues)
2. Email Contact: software@scec.usc.edu

## Contributing
We welcome contributions to the UCVM software framework. An overview of the process for contributing seismic models or software updates to the UCVM Project is provided in the [UCVM contribution](CONTRIBUTING.md) guidelines. UCVM contributors agree to abide by the code of conduct found in our [Code of Conduct](CODE_OF_CONDUCT.md) guidelines.

## Credits
Development of UCVM is a group effort. Developers that have contributed to the UCVM docker software are listed in the [CREDITS.md](Credits.md) file in this repository.

## License
The UCVM software is distributed under the BSD 3-Clause open-source license. Please see the [LICENSE.txt](LICENSE.txt) file for more information.
