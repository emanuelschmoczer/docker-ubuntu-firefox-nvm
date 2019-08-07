# Dockerfile
#
# Project: docker-ubuntu-firefox-nvm
# License: MIT
#
# Copyright (C) 2019 Emanuel Schmoczer

FROM ubuntu:latest

MAINTAINER Emanuel Schmoczer

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Set debconf to run non-interactively
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

ENV HOME /root

RUN apt-get update && \
        apt-get install -y -q --no-install-recommends firefox \
        apt-transport-https \
        build-essential \
        ca-certificates \
        curl \
        git \
        libssl-dev \
        wget && \
        apt-get clean && \
        mkdir $HOME/.nvm

ENV NVM_DIR $HOME/.nvm

# Install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash  && \
        rm -f install.sh
