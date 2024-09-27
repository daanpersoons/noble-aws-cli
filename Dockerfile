FROM ubuntu:xenial

LABEL \
  maintainer="Daan Persoons <daanpersoons@outlook.com>" \
  org.opencontainers.image.title="noble-aws-cli" \
  org.opencontainers.image.description="AWS-cli on Ubuntu Noble Docker image." \
  org.opencontainers.image.authors="Daan Persoons <daanpersoons@outlook.com>" \
  org.opencontainers.image.url="https://github.com/daanpersoons/noble-aws-cli" \
  org.opencontainers.image.licenses="MIT"

ENV GCLOUD_VERSION 239.0.0

# Let the container know that there is no TTY
ARG DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt-get -y update \
 && apt-get install -y -qq --no-install-recommends \
    curl \
    ca-certificates \
    unzip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/* /var/tmp/*

# Install AWS CLI v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf awscliv2.zip aws/
