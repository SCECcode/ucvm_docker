xhost + 127.0.0.1
docker run -e DISPLAY=host.docker.internal:0 --rm -it --mount type=bind,source="$(pwd)"/target,destination=/app/target mpihuisu/py2ucvm:1.2
