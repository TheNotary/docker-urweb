# Ur/Web in Docker

A Docker container for Ur/Web which will compile and serve the demo located [here](http://www.impredicative.com/ur/demo/).

## Getting the container

The container is based on Ubuntu 15.10 and Ur/Web 20151122.

```
$  make build
$  make console
#  . /docker-entrypoint.sh
```

Test with:

```
$  curl 127.0.0.1:8080/Demo/Demo/main
```
