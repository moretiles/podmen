#!/bin/bash

set -eu

if (( "$(id -u)" != 0 )); then
	echo I must be run as root
	exit 1
fi

podman generate systemd --new --requires bind-eth_podman.service --after bind-eth_podman.service --after vault.target --requires vault.target --wants vault-certificate@prometheus_podman.timer prometheus
echo 'WAIT
echo 'Make sure to enable vault-certificate@docker_auth_podman.timer'
echo 'WAIT
