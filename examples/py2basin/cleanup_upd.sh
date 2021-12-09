docker rmi mpihuisu/py2basin:1.0 -f 
docker rmi py2basin -f 

docker rmi $(docker images -f dangling=true -q ) -f

docker images

### deep clean, docker system prune -a -f --volumes
