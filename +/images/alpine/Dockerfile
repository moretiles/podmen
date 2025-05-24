FROM docker.io/library/alpine
ADD ../../certs/ /usr/local/share/ca-certificates
RUN apk add --no-cache dumb-init ca-certificates && update-ca-certificates
ENTRYPOINT [/usr/bin/dumb-init", "--"]
