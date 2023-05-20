#!/bin/sh

docker build -t $(whoami)/42wob .
docker run -d -it -v `pwd`:/ProjectFolder/ --name $USER-42wob $(whoami)/42wob
docker exec -it $USER-valgrind bash
