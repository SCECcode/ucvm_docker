docker rmi mpihuisu/py2ucvm:1.2 -f 
docker rmi py2ucvm -f 

docker rmi $(docker images -f dangling=true -q ) -f

docker images

### deep clean, docker system prune -a -f --volumes
