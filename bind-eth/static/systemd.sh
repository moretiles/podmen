#!/bin/bash

set -eu

if (( "$(id -u)" != 0 )); then
	echo I must be run as root
	exit 1
fi

podman generate systemd --new bind-eth
echo <<EOF
##############################################
Please add:
[Service]
ExecStartPre=sleep 20
##############################################
