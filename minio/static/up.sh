#!/bin/bash

set -euo pipefail

sudo podman-compose --podman-run-args="--userns=auto --log-driver=k8s-file --log-opt path=/var/log/containers/$(pwd | awk -F '/' '{$NF=""; print $0}' | sed 's/ $//' | sed 's/.* //')" up -d
