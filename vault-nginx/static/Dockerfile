FROM localhost/alpine:1.1
RUN apk add --no-cache nginx && rm -rf /var/lib/nginx/log
CMD ["nginx", "-g", "daemon off;"]
