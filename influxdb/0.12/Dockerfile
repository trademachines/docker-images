FROM alpine:3.9

# Install InfluxDB
ENV INFLUXDB_VERSION=0.12.2-1
ENV INFLUXDB_FILE=/tmp/influxdb.tgz
ENV INFLUXDB_DIR=/tmp/influxdb

RUN echo 'hosts: files dns' >> /etc/nsswitch.conf
RUN apk add --no-cache tzdata bash curl
RUN mkdir -p ${INFLUXDB_DIR} && \
    apk add --no-cache --virtual .build-deps wget gnupg tar ca-certificates && \
    update-ca-certificates && \
    for key in \
        05CE15085FC09D18E99EFB22684A14CF2582E0C5 ; \
    do \
        gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
        gpg --keyserver pgp.mit.edu --recv-keys "$key" || \
        gpg --keyserver keyserver.pgp.com --recv-keys "$key" ; \
    done && \
    wget -O ${INFLUXDB_FILE}.asc https://s3.amazonaws.com/influxdb/influxdb-${INFLUXDB_VERSION}-static_linux_amd64.tar.gz.asc && \
    wget -O ${INFLUXDB_FILE} https://s3.amazonaws.com/influxdb/influxdb-${INFLUXDB_VERSION}-static_linux_amd64.tar.gz && \
    gpg --batch --verify ${INFLUXDB_FILE}.asc ${INFLUXDB_FILE} && \
    tar -C ${INFLUXDB_DIR} -xzf ${INFLUXDB_FILE} && \
    rm -f ${INFLUXDB_DIR}/influxdb.conf && \
    chmod +x ${INFLUXDB_DIR}/* && \
    cp -a ${INFLUXDB_DIR}/* /usr/bin && \
    rm -rf /tmp/* && \
    apk del .build-deps

ADD config.toml /config/config.toml
ADD run.sh /run.sh
RUN chmod +x /*.sh

ENV PRE_CREATE_DB **None**
ENV SSL_SUPPORT **False**
ENV SSL_CERT **None**

# Admin server WebUI
EXPOSE 8083

# HTTP API
EXPOSE 8086

# Raft port (for clustering, don't expose publicly!)
#EXPOSE 8090

# Protobuf port (for clustering, don't expose publicly!)
#EXPOSE 8099

VOLUME ["/data"]

CMD ["/run.sh"]
