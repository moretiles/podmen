FROM localhost/alpine:1.1
#RUN addgroup -g 16002 vault-unseal-docker && adduser -u 16002 -G vault-unseal-docker -s /sbin/nologin -D vault-unseal-docker
RUN wget 'https://github.com/lrstanley/vault-unseal/releases/download/v0.7.0/vault-unseal_linux_arm64' -O /bin/vault-unseal && chmod 555 /bin/vault-unseal
CMD [/bin/vault-unseal", "-c", "/etc/vault-unseal.yaml"]
