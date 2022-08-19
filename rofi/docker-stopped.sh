#!/usr/bin/env bash

if [ -z $@ ]
then

#containerNames=$(docker ps --format '{{.Names}}')
#containerIDs=$(docker ps --format '{{.ID}}')

gen_containers()
{
	docker ps -a --format '{{.Names}}'
}

echo ;gen_containers

else
    CONTAINER=$@
    if [ -n "${CONTAINER}" ] 
	then
		kitty --detach --hold -e docker start "${CONTAINER}"
    fi
fi
