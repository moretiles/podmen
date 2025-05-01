#!/bin/bash

set -e

name="${PWD%/*}"
name="${name##*/}"
remote_host=_.home.arpa
remote_user=_

echo "${name}"
#exit 0

mkdir -p ../live
vault-templates ./templates
cp ./up.sh ./systemd.sh ../live
tar cf ../live.tar ../live
find ../live -type f -exec rm "{}" \;
scp ../live.tar "${remote_user}"@"${remote_host}":/home/"${remote_host}"/podman/"${name}"/live.tar
sleep 1
ssh "${remote_host}" "cd /home/${remote_host}/podman/${name}"'; sudo tar -pxf ./live.tar -C tmp; while IFS= read -r tmp_file; do live_file="${tmp_file/tmp\/live\//live\/}"; echo "${tmp_file}" "${live_file}"; sudo chown "$(stat -c "%u:%g" "${live_file}")" "${tmp_file}"; sudo mv "${tmp_file}" "${live_file}"; done <<< "$(find tmp/ -type f)"; sudo rm -r tmp/live live.tar'
