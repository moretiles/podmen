#!/bin/bash

set -eu

#if [[ "$(id -u)" != 0 ]]; then
    #echo "Must be run as root" 1>&2
    #exit 1
#fi

name="${PWD%/*}"
name="${name##*/}"

echo "${name}"
#exit 0

tar cf ../live.tar ../live
scp ../live.tar hostpi.home.arpa:/home/debian/podman/${name}/live.tar
sleep 1
ssh hostpi.home.arpa "cd /home/debian/podman/${name}; sudo tar xf ./live.tar; rm live.tar"
#ssh hostpi.home.arpa "mkdir -p /home/debian/podmen/${name}; tar xf /home/debian/podmen/live.tar"
