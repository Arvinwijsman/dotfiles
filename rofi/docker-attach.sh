#!/usr/bin/env bash

if [ -z $@ ]
then

gen_containers()
{
	docker ps --format '{{.Names}}'
}

echo ;gen_containers

else
    CONTAINER=$@
    if [ -n "${CONTAINER}" ] 
	then
		kitty --detach --hold -e docker exec -it "${CONTAINER}" bash
    fi
fi
