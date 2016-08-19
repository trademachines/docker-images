FROM elasticsearch:2.3

RUN bin/plugin install cloud-aws \
    && usermod -u 1000 elasticsearch \
    && chown -R elasticsearch:elasticsearch /usr/share/elasticsearch

ENTRYPOINT ["/docker-entrypoint.sh", "--discovery.zen.ping.multicast.enabled=false", "--discovery.type=ec2", "--network.host=_ec2_"]
