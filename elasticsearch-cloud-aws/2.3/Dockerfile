FROM elasticsearch:2.3

RUN bin/plugin install cloud-aws \
    && usermod -u 1000 elasticsearch \
    && chown -R elasticsearch:elasticsearch /usr/share/elasticsearch

EXPOSE 9200 9300

ENTRYPOINT ["/docker-entrypoint.sh", "--discovery.zen.ping.multicast.enabled=false", "--discovery.type=ec2", "--network.publish_host=_ec2_"]
