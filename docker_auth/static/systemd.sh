#!/bin/bash

set -eu

if (( "$(id -u)" != 0 )); then
	echo I must be run as root
	exit 1
fi

podman generate systemd --new --requires bind-eth_podman.service --after bind-eth_podman.service --after vault.target --requires vault.target --wants vault-certificate@docker_auth_podman.timer docker_auth
echo 'WAIT
echo 'Make sure to activate vault-certificate@docker_auth_podman.timer'
echo 'WAIT
