# miniucvm

## search for images:

    docker search sceccode

## build an image

    docker image build -t miniucvm .
    docker tag miniucvm sceccode/miniucvm:1.0
    docker push sceccode/miniucvm:1.0

## running container from an image with a local host 'target' directlry: 

    mkdir target
    docker run --rm -it --mount type=bind,source="$(pwd)"/target,destination=/app/target  sceccode/miniucvm:1.0
    
## to test the container

    cp ../examples/*.sh .
    chmod og+x *.sh

    ./run_ucvm_plot.sh
    ./run_ucvm_query.sh

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


