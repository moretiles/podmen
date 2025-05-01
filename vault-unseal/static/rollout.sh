#!/bin/bash

set -eu

if [[ "$(id -u)" != 0 ]]; then
	echo I must be run as root 1>&2
	exit 1
fi

mkdir -p ../live
sudo vault-templates ./templates
sudo chmod 600 ../live/vault-unseal/vault-unseal.yaml
cp ./Dockerfile ./up.sh ./systemd.sh ../live
#chown -R dv:dv ../live
../../deploy.sh
#rm -rf ../live.tar ../live
