FROM docker.i../../+/grafana/grafana
user root
ADD ../../+/certs/ /usr/local/share/ca-certificates
RUN apk add --no-cache ca-certificates && update-ca-certificates
user grafana
