#!/bin/bash

set -eu

if [[ "$(id -u)" != 0 ]]; then
	echo I must be run as root 1>&2
	exit 1
fi

mkdir -p ../live
sudo vault-templates ./templates
cp ./systemd.sh ../live/systemd.sh
chown -R dv:dv ../live
sudo -u dv ../../deploy.sh
#rm -rf ../live.tar ../live
