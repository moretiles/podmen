FROM docker.io/bitnami/openldap
ADD ../../+/certs/ /usr/local/share/ca-certificates
# Need to do a switcheroo here to use custom permissions just for this then switch back
USER 0
RUN update-ca-certificates
USER 1001
#RUN apt-get update && update-ca-certificates
