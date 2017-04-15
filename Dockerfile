############################################################
# Dockerfile to build Elasticsearch 3.4.2 environment
# Based on baseImage
############################################################

# Set the base image to openjdk:8-jre
FROM openjdk:8-jre

# File Author / Maintainer
MAINTAINER Marcio Godoi <souzagodoi@gmail.com>

# Run as a root user
USER root

ENV ELASTICSEARCH_VERSION 5.3.0
ENV ELASTICSEARCH_DEB_VERSION 5.3.0
ENV ELASTICSEARCH_HOME=/opt/elasticsearch

RUN apt-get update && \
    apt-get install -y \
    wget \
   	tar \
	less \
	git \
	curl \
	vim \
	wget \
	unzip \
	netcat \
	software-properties-common \
	telnet

RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.3.0.tar.gz -P /tmp/elasticsearch && \
  tar -xvzf /tmp/elasticsearch/elasticsearch-5.3.0.tar.gz -C /tmp/elasticsearch && \
  mv /tmp/elasticsearch/elasticsearch-5.3.0 $ELASTICSEARCH_HOME && \
  rm -rf /tmp/elasticsearch


# Create elasticsearch group and user
RUN groupadd -g 1000 elasticsearch \
  && useradd -d "$ELASTICSEARCH_HOME" -u 1000 -g 1000 -s /sbin/nologin elasticsearch

# Creates directory used to store the data files
RUN mkdir -p /var/elasticsearch/data

# Creates directory used to store the log files
RUN mkdir -p /var/elasticsearch/log

# Change directories ownership to elasticsearch user and group
RUN chown -R elasticsearch:elasticsearch $ELASTICSEARCH_HOME /var/data/elasticsearch /var/log/elasticsearch

# Run the container as elasticsearch user
USER elasticsearch

# Install Elasticsearch monitoring plugins
RUN ./bin/plugin install mobz/elasticsearch-head && ./bin/plugin install royrusso/elasticsearch-HQ

# Exposes http ports
EXPOSE 9200 9300