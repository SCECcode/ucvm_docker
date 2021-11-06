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
