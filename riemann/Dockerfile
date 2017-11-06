FROM jeanblanchard/java:8

MAINTAINER Martin Pallmann <martin.pallmann@trademachines.com>

ENV RIEMANN_VERSION 0.2.10

WORKDIR /opt

ENV PATH ${PATH}:/opt/riemann/bin

RUN apk add --update curl bash \
  && curl https://aphyr.com/riemann/riemann-${RIEMANN_VERSION}.tar.bz2 \
  | tar xj \
  && ln -s riemann-${RIEMANN_VERSION} riemann \
  && apk del curl

EXPOSE 5555

ENTRYPOINT riemann
