#!/usr/bin/env bash

# DCDIRS=("traefik" "homepage" "code-server" "gitlab" "jenkins" "knowledge" "leantime" "wiki")
DCDIRS=$(find . -mindepth 1 -maxdepth 1 -type d -not -path './traefik')
for DCDIR in ${DCDIRS[@]}; do
    DCPATH=$(readlink -f $DCDIR)
    pushd $DCPATH
    if [ -f "docker-compose.yml" ]; then
        sudo docker-compose down
    fi
    popd
done

pushd $(readlink -f "./traefik")
if [ -f "docker-compose.yml" ]; then
    sudo docker-compose down
fi
popd

# sudo docker system prune --all --force
