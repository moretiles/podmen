#!/bin/bash

set -eu

if (( "$(id -u)" != 0 )); then
	echo I must be run as root 1>&2
	exit 1
fi

mkdir -p ../live
vault-templates ./templates
cp ./systemd.sh ./up.sh ../live
../../deploy.sh
