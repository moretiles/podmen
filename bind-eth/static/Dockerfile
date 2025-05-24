FROM localhost/alpine:1.1
RUN apk add --no-cache bind && rm /etc/bind/rndc.key
CMD [/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf.authoritative"]
