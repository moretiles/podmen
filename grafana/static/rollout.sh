#!/bin/bash

set -e

if [[ "$(id -u)" != 0 ]]; then
	echo I must be run as root 1>&2
	exit 1
fi

mkdir -p ../live
vault-templates ./templates
cp ./up.sh ./systemd.sh ../live
../../deploy.sh
#rm -rf ../live ../live.tar
