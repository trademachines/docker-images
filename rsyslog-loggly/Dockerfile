FROM alpine:3.4

RUN apk --no-cache add rsyslog \
    && mkdir -p /etc/rsyslog.d \
    && mkdir -p /var/spool/rsyslog

COPY rsyslog.conf /etc/rsyslog.conf
COPY loggly.conf /etc/rsyslog.d/loggly.conf
COPY files.conf /etc/rsyslog.d/files.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh

VOLUME /var/log

ENTRYPOINT ["/docker-entrypoint.sh"]
