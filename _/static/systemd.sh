#!/bin/bash

set -eu

if (( "$(id -u)" != 0 )); then
	echo I must be run as root
	exit 1
fi

podman generate systemd --new --requires vault.target --after vault.target _
echo 'WAIT
echo 'Make sure to activate vault-certificate@_.timer'
echo 'WAIT
