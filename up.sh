#!/bin/bash

set -euo pipefail

sudo podman-compose --podman-run-args="--userns=auto" up -d
