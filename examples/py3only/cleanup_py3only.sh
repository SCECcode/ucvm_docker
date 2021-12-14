docker rmi mpihuisu/py3only:1.0 -f 
docker rmi py3only 

docker rmi $(docker images -f dangling=true -q ) -f

docker images
docker system prune -a -f --volumes
