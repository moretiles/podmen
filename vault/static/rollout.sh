#!/bin/bash

set -eu

if (( "$(id -u)" != 0 )); then
	echo I must be run as root 1>&2
	exit 1
fi

mkdir -p ../live
vault-templates templates
cp ./config ../live/fs/vault/config
#cp -r ../certs/. ../live/fs/vault/certs
cp ./Dockerfile ./entrypoint.sh ./up.sh ./systemd.sh ../live
#chown -R dv:dv ../live
../../deploy.sh
#rm -rf ../live.tar ../live
