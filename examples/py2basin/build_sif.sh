##
## this is is the pull docker image and build singularity image

singularity pull docker://mpihuisu/py2basin:2.0

## this is to run the singularity container from the singularity .sif file
##
##singularity shell py2basin_2.0.sif 
## 
## some hints..
##
# sudo singularity build ubuntu.simg base_definition
# 
#singularity search docker://sceccode
#singularity pull docker://sceccode/ucvm_1210_cvmh
# 
#>>>base_definition<<<
#  Bootstrap: shub
#  From: singularityhub/ubuntu
#  
#  %runscript
#      exec echo "The runscript is the containers default runtime command!"
#  
#  %files
#     /home/vanessa/Desktop/hello-kitty.txt        # copied to root of container
#     /home/vanessa/Desktop/party_dinosaur.gif     /opt/the-party-dino.gif #
#  
#  %environment
#      VARIABLE=MEATBALLVALUE
#      export VARIABLE
#  
#  %labels
#     AUTHOR mei@usc.edu
#  
#  %post
#      apt-get update && apt-get -y install python3 git wget
#      mkdir /data
#      echo "The post section is where you can install, and configure your container."
#  

