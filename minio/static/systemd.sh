#!/bin/bash

set -eu

if (( "$(id -u)" != 0 )); then
	echo I must be run as root
	exit 1
fi

podman generate systemd --new --requires vault.target --after vault.target minio
echo 'WAIT
echo 'Make sure to activate vault-certificate@minio_podman.timer'
echo 'WAIT
