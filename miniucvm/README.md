
## building image

docker image build -t miniucvm:1.0 .

## running container from image

mkdir target
docker run --rm -it --mount type=bind,source="$(pwd)"/target,destination=/app/target  miniucvm:1.0

## manipulate the container

docker --help
docker container

## cleanup images

docker rmi $(docker images -f dangling=true -q )
docker rmi $(docker images -f dangling=true -q ) -f

docker rmi miniucvm:1.0 
docker rmi miniucvm:1.0 -f 

## deep cleaning images & volumes

docker rm -f $(docker ps -a -q)
docker system prune -a -f --volumes
docker volume rm target


