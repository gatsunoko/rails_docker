FROM ruby:3.4.9-alpine

RUN echo 'Set disable_coredump false' >> /etc/sudo.conf

RUN apk add --no-cache \
    # nokogiri
    build-base \
    libxml2-dev \
    libxslt-dev \
    # postgresql
    postgresql-dev \
    # mysql
    mysql-client-dev \
    pkgconf \
    # others
    nodejs \
    yarn \
    tzdata \
    git \
    vim \
    bash \
    sudo

ARG uid
ARG gid

# add user
RUN addgroup -g $gid docker && \
    adduser -S -u $uid -G docker docker && \
    echo 'docker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    echo 'docker:docker' | chpasswd

USER docker
