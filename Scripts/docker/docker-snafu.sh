#!/bin/bash
echo "Perform hardcore reset? (y/N) "
read answer

docker stop $(docker ps -aq)

if [[ $answer -eq "y" ]]; then
    echo "---- NUKING DOCKER SHIT"
    docker system prune --volumes
    docker image prune -a
fi;
