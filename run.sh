#!/bin/bash

while getopts n:v: flag
do
    case "${flag}" in
        n) name=${OPTARG};;
        v) vol=${OPTARG};;
    esac
done

echo "Starting docker with name $name";
echo "Using volume $vol";

docker stop $name
docker rm $name

docker build -t $name --no-cache .
#docker build -t $name .
docker run -p 3003:80 --name $name --volume $vol:/var/www/html $name
