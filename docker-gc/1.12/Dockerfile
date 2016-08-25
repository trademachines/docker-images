FROM alpine:3.4

ENV DOCKER_VERSION=1.12.1
ENV BUILD_DEPS=curl

# We get curl so that we can avoid a separate ADD to fetch the Docker binary, and then we'll remove it
RUN apk --update add bash $BUILD_DEPS \
  && cd /tmp/ \
  && curl -sSL -O https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz \
  && tar zxf docker-${DOCKER_VERSION}.tgz \
  && mv docker/* /usr/local/bin/ \
  && chmod +x /usr/local/bin/docker* \
  && curl -sSL -o /docker-gc https://raw.githubusercontent.com/spotify/docker-gc/master/docker-gc \
  && chmod +x /docker-gc \
  && apk del $BUILD_DEPS \
  && rm -rf /tmp/* \
  && rm -rf /var/cache/apk/*

VOLUME /var/lib/docker-gc

ENTRYPOINT ["/docker-gc"]
