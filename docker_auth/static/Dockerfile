FROM docker.i../../+/cesanta/docker_auth
ADD ../../+/certs/ /usr/local/share/ca-certificates
RUN apk add --no-cache ca-certificates dumb-init && update-ca-certificates
ENTRYPOINT ["dumb-init", "--"]
CMD../../+/docker_auth/auth_server --v=2 --alsologtostderr /etc/docker_auth/auth_config.yml
USER nobody:nobody
