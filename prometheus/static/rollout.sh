#!/bin/bash

set -e

mkdir -p ../live
vault-templates ./templates
cp ./Dockerfile ./up.sh ./systemd.sh ../live
../../deploy.sh
