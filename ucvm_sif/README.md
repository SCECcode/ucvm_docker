## This directory contains the scripts used to build a docker image that can be converted to a singularity image
There are a few differences between docker images and singularity images. Specifically, our docker images assign
a userid:groupid to the contents, so that the programs in the container doesn't run as root. We typically assign
the userid:groupid of the person building the image to the username in the image
Second, the docker image bind mounts a subdirectory as a shared directory between the host and the container.
However this causes problems for a singularity image. In particular, the cluster will typically mount
selected directories in the image. So our docker files remove the volume command when we create them
for use as singularity images.


## Dockerfile
This lists the steps needed to build the container.

## Contents of large_file_inputs

(base) [maechlin@discovery2 largefiles]$ ./get_largefiles.py 
Running in ./largefiles source directory. 
This script will download and install ucvm.e, ucvm_utah.e and several other files.
Due to the size of the files, this download could take minutes to hours to complete.
Would you like to download cvms5, will need 1.2G?
Enter yes or no: yes
Would you like to download cca, will need 9.2G?
Enter yes or no: no
Would you like to download cs173, will need 72G?
Enter yes or no: no
Would you like to download cs173h, will need 72G?
Enter yes or no: no
Would you like to download cvms, will need 326M?
Enter yes or no: yes
Would you like to download cvmsi, will need 1.6G?
Enter yes or no: yes
Would you like to download cencal, will need 21G?
Enter yes or no: no
Would you like to download cvmh, will need 1.6G?
Enter yes or no: yes
Would you like to download albacore, will need 2.3M?
Enter yes or no: yes
Would you like to download cvlsu, will need 7.0M?
Enter yes or no: yes
Would you like to download ivlsu, will need 3.1M?
Enter yes or no: yes
Would you like to download wfcvm, will need 50M?
Enter yes or no: yes
