FROM ubuntu:20.04
SHELL ["/bin/bash", "-c"]

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install \
        python3.9 \
        python3.9-dev \
        python3-pip \
        build-essential \
        libssl-dev \
        libffi-dev \
        ufw \
        nginx

WORKDIR /data
COPY requirements.txt requirements.txt
RUN python3.9 -m pip install --upgrade pip \
    && python3.9 -m pip install -r requirements.txt