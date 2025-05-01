# Custom alpine image

## docker.io/library/alpine -> localhost/alpine

---

This image inherits from the docker.io alpine image.
CA certificates and any self-signed certificates are added.
The entrypoint is dumb-init to handle child processes and signals properly[1](https://github.com/Yelp/dumb-init#why-you-need-an-init-system).
