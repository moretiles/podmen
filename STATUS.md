# Procedures to check if various services are "online"


## NGINX
Run `curl http://{IP_ADDRESS_OF_HOST}:80`
**Output should complain a HTTP request was sent to a HTTPS port and include <center>nginx<center> at the body's end**


## Vault (assumption is certificates have already been setup)
Run `curl https://vault.home.arpa:8200`
**Output should include redirect to /ui/**
### Check if Vault is unsealed
Open vault in your browser. if it asks you to enter an unseal token it is sealed. If it asks you to sign in using a token it is unsealed.


## Certificate authority (managed using Vault)
Run `curl http://ca.home.arpa:8202/v1/pki/issuer/default/pem | openssl x509 -text`
**Output should indicate openssl was able to read in a valid certificate. Make sure http: is used.**


## OpenLDAP
Run `openssl s_client -connect ldap.home.arpa:636`
**Output should indicate a valid certificate was found. If not have fun debugging the tree.**


## Docker registry
Run `openssl s_client -connect registry.home.arpa:5000`
**Output should indicate a valid certificate was found.**


## Docker auth
Run `podman login registry.home.arpa:5000`
**If login succeeds then you know auth is working**


## Prometheus
Run `curl https://prometheus.home.arpa:9090`
**Output should say unauthorized if you enforce logins to access Prometheus**


## Loki
TODO: Not currently online LOL


## grafana
Run `curl https://grafana.home.arpa:3000`
**Output should include redirect to /login**


## postgres
Run `openssl s_client postgres.home.arpa:5432`
**Output should indicate a valid certificate was found.**


## MINIO
Run `openssl s_client minio.home.arpa:9000`
Run `openssl s_client minio.home.arpa:9001`
**Output should indicate certificate was found on both ports**
