FROM docker.i../../+/library/postgres
#user root
ADD ../../+/certs/ /usr/local/share/ca-certificates
#RUN apk add --no-cache ca-certificates && update-ca-certificates
RUN apt-get -y update && apt-get -y install --no-install-recommends dumb-init ca-certificates && update-ca-certificates
#user grafana
ENTRYPOINT [../../+/usr/bin/dumb-init", "--"]
CMD ["docker-entrypoint.sh", "postgres", "-c", "config_file../../+/etc/postgresql/postgresql.conf"]
