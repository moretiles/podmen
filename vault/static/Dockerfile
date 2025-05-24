FROM docker.io/hashicorp/vault
#RUN addgroup -g 16001 vault-docker && adduser -u 16001 -G vault-docker -s /sbin/nologin -D vault-docker 
#USER vault-docker:vault-docker
#RUN ln -s /var/tmp/vault-token /.vault-token.tmp
#COPY /entrypoint.sh /entrypoint.sh
#CMD /entrypoint.sh
ADD ../../+/certs/ /usr/local/share/ca-certificates
RUN apk add --no-cache ca-certificates && update-ca-certificates && echo "export HOME /var/tmp" >> /etc/profile
CMD vault server -config /vault/config
