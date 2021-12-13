docker rmi mpihuisu/py2basin:2.0 -f 
docker rmi py2basin -f 

docker rmi $(docker images -f dangling=true -q ) -f
docker images

docker system prune -a -f --volumes
