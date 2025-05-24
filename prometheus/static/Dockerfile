FROM localhost/alpine:1.1
RUN apk add --no-cache prometheus
CMD prometheus --config.file /etc/prometheus/prometheus.yml --web.config.file /etc/prometheus/webconfig.yml
