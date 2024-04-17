#!/usr/bin/env bash

pushd $(readlink -f "./traefik")
if [ -f "docker-compose.yml" ]; then
    sudo docker-compose up -d --build
fi
popd

DCDIRS=$(find . -mindepth 1 -maxdepth 1 -type d -not -path './traefik')
for DCDIR in ${DCDIRS[@]}; do
    DCPATH=$(readlink -f $DCDIR)
    pushd $DCPATH
    if [ -f "docker-compose.yml" ]; then
        sudo docker-compose up -d --build
    fi
    popd
done
