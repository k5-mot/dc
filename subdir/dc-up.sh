#!/usr/bin/env bash

# pushd $(readlink -f "./traefik")
# if [ -f "docker-compose.yml" ]; then
#     sudo docker-compose kill
#     sudo docker-compose rm --force
#     sudo docker-compose down --remove-orphans
#     sudo docker-compose up --build --force-recreate --detach
# fi
# popd

DCDIRS=("traefik" "homepage" )
# DCDIRS=("traefik" "homepage" "code-server" "gitlab" "jenkins" "knowledge" "leantime" "wiki")
# DCDIRS=$(find . -mindepth 1 -maxdepth 1 -type d -not -path './traefik')
for DCDIR in ${DCDIRS[@]}; do
    DCPATH=$(readlink -f $DCDIR)
    pushd $DCPATH
    if [ -f "docker-compose.yml" ]; then
        sudo docker-compose kill
        sudo docker-compose rm --force
        sudo docker-compose down --remove-orphans
        sudo docker-compose up --build --force-recreate --detach

    fi
    popd
done
