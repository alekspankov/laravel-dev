Building Multiplatform Images
=============================

Requirements
------------

1. [Docker](https://docker.com)
1. [Buildx](https://docs.docker.com/build/install-buildx/)

Build Process
-------------

1. Clone this repo `git clone https://github.com/alekspankov/laravel-dev.git`
1. Make sure you have installed latest docker on your localbox - see [Official Docker Instructions](https://docs.docker.com/get-docker/) with [Buildx support](https://docs.docker.com/build/install-buildx/) - run `$ docker build buildx --help`
1. Run 
```shell
$ laravel-dev % docker buildx build \
$ --platform linux/amd64,linux/arm64,linux/arm/v7 \ # change platforms according your needs
$ -t username/laravel-dev:7.4 \  # change tag to your own
$ --push .
```
