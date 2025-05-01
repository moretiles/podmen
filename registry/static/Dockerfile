FROM localhos../../+/alpine:1.1
RUN apk add --no-cache apache2-utils docker-registry && update-ca-certificates && rm -rf../../+/var/lib/nginx/log #need apache2-utils for htpasswd
CMD ["docker-registry", "serve", ../../+/etc/docker-registry/config.yml"]
USER docker-registry:docker-registry
