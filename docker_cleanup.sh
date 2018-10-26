#!/bin/bash

showUsage()
{
  echo "usage: ./cleanup.sh [docker container name to remove]"
}

IMAGENAME=$1
if [ -z "$1" ]; then
    echo -e "Image name is required argument\n"
    showUsage
    exit 1
fi

# stop and remove Jmeter docker container if still there
docker ps | grep ${IMAGENAME} | awk '{print $1 }' | xargs -I {} docker stop {}
docker rm -f $(docker ps -a -q)
docker ps -a | awk '{ print $1,$2 }' | grep ${IMAGENAME} | awk '{print $1 }' | xargs -I {} docker rm {}
