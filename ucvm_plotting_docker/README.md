## Updated instructions
====== running on usc discovery
a) create conda environment

conda create -n withPython2 python=2.7.15 scipy pip numpy matplotlib basemap basemap-data-hires

b) building UCVM,
   
module load gcc/8.3.0 openmpi/4.0.2
module load pmix/3.1.3
module load anaconda3

export LD_PRELOAD=/spack/apps/gcc/8.3.0/lib64/libstdc++.so.6

export TEST_UCVM_TARGET=/project/scec_608/mei/ucvm_19_4
export UCVM_SRC_PATH=$TEST_UCVM_TARGET/UCVM
export UCVM_INSTALL_PATH=$TEST_UCVM_TARGET/install

rm -rf $TEST_UCVM_TARGET 
mkdir $TEST_UCVM_TARGET

cd $TEST_UCVM_TARGET
git clone git@github.com:SCECcode/UCVMC.git -b toPython3 UCVM

cd $UCVM_SRC_PATH/largefiles 
./get_large_files.py << EOB
y
y
n
n
y
y
y
y
n
EOB


cd $UCVM_SRC_PATH/largefiles; ./check_largefiles_md5.py
cd $UCVM_SRC_PATH/largefiles; ./stage_large_files.py

cd $UCVM_SRC_PATH
./ucvm_setup.py -d -a << EOF &> ucvm_setup_install.log
$UCVM_INSTALL_PATH
EOF

cd $UCVM_SRC_PATH;
make runcheck &> ucvm_setup_make_check.log

echo "..EXITING.."
exit

c) test UCVM
   rm -rf $UCVM_SRC_PATH
   cd $UCVM_INSTALL_PATH
   cd conf
   source ucvm_env.sh
   cd $UCVM_INSTALL_PATH/tests
   ./run-testing

d) building ucvm_plotting
   conda activate withPython2
   cd $UCVM_INSTALL_PATH/conf
   source ucvm_env.sh
   cd $TEST_UCVM_TARGET
   git clone https://github.com/SCECcode/ucvm_plotting.git
   cd ucvm_plotting
   ./run_depth.sh
   ### kill the plot
   conda deactivate

e) test ucvm_plotting / get an allocation 
   cd $TEST_UCVM_TARGET/ucvm_plotting/examples
   salloc --ntasks=1 --time=02:00:00
   conda activate withPython2
   ./run-tests
   conda deactivate

##  Previous instructions
xhost + 127.0.0.1
docker run -e DISPLAY=host.docker.internal:0 --rm -it --mount type=bind,source="$(pwd)"/target,destination=/app/target mpihuisu/py2ucvm:1.2

wait for the bash prompt,

try:

xeyes

which view_png.py

to test,

cd /app/ucvm_plotting/examples/cross_section
./run_cvmh_cross_section_vs.sh

and 
view_png.py -f cvmh_cross_section_vs.png

these steps will work on you mac laptop.
I tried to run the image from moho but xhost is not on moho. 
