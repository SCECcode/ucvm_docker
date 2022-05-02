## make target directory
## and run the following instructions

xhost + 127.0.0.1

docker run -e DISPLAY=host.docker.internal:0 --rm -it --mount type=bind,source="$(pwd)"/target,destination=/app/target  --privileged py2basin


## once your container runs
##
## plot_horizontal_slice.py -b 33.35,-118 -u 34.35,-117 -e 1000 -d vs -c cvmh -a s -s 0.01 -o new.png -i /usr/local/opt/ucvm
## view_png.py -f new.png
