FROM elasticsearch:2.3.5

RUN bin/plugin install cloud-aws \
    && bin/plugin install lmenezes/elasticsearch-kopf/2.x \
    && usermod -u 1000 elasticsearch \
    && chown -R elasticsearch:elasticsearch /usr/share/elasticsearch \
    && apt-get update && apt-get install -y --no-install-recommends awscli \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh", "--discovery.type=ec2", "--network.publish_host=_ec2_"]
