FROM ubuntu:18.04

# prevent warning messages from apt-key
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
ENV DEBIAN_FRONTEND=noninteractive

ENV BUILD_DEPS="build-essential cmake make libopencv-dev"

# update packages, install curl and dependencies
RUN apt-get clean && apt-get update && \
    apt-get install -y curl apt-utils gnupg ca-certificates file && \
    apt-get install -y --no-install-recommends $BUILD_DEPS

# nodeJS & yarn
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash - && \
    apt-get update && apt-get install -y nodejs && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn
