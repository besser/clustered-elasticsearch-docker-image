# clustered-elastisearch-docker-image
A clustered Elasticsearch docker image allows you spinning up an Elasticsearch cluster in a few seconds.

This image is available on DockerHub in this link <https://hub.docker.com/r/godois/elasticsearch-clustered/>

## Technologies used in this project

- Shell script
- Docker
- Docker-compose

## Setting up this project locally

> **Note:**
The fastest way to get this application up and running locally is using **Docker**.  Be sure that you have at least **Docker 1.13.0** installed on your machine as well as **Docker-compose version 1.14.0**

1. Clone this repository

```shell
$ git clone https://github.com/godois/clustered-elasticsearch-docker-image.git
```
2. Building the local image

You should execute the follow command in the project directory

```shell
$ docker build -t localhost/elasticsearch-clustered:1.0 .
```
