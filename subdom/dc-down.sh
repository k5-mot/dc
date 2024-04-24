#!/usr/bin/env bash

DCDIRS=("code-server" "gitlab" "jenkins" "knowledge" "leantime" "wiki" "homepage" "traefik")
DCDIRS=$(find . -mindepth 1 -maxdepth 1 -type d -not -path './traefik')
for DCDIR in ${DCDIRS[@]}; do
    DCPATH=$(readlink -f $DCDIR)
    pushd $DCPATH
    if [ -f "docker-compose.yml" ]; then
        sudo docker-compose stop
        sudo docker-compose rm --force
        sudo docker-compose down --remove-orphans
    fi
    popd
done

# pushd $(readlink -f "./traefik")
# if [ -f "docker-compose.yml" ]; then
#     sudo docker-compose stop
#     sudo docker-compose rm --force
#     sudo docker-compose down --remove-orphans
# fi
# popd

sudo docker system prune --all --force
