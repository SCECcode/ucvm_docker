
#docker run --rm  -it miniucvm:1.0

docker run --rm -it --mount type=bind,source="$(pwd)"/target,destination=/app/target  miniucvm:1.0
