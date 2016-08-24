FROM elasticsearch:1.7

RUN bin/plugin install elasticsearch/elasticsearch-cloud-aws/2.7.1 \
    && bin/plugin install lmenezes/elasticsearch-kopf/v1.6.2 \
    && usermod -u 1000 elasticsearch \
    && chown -R elasticsearch:elasticsearch /usr/share/elasticsearch

ENTRYPOINT ["/docker-entrypoint.sh", "--discovery.zen.ping.multicast.enabled=false", "--discovery.type=ec2", "--network.publish_host=_ec2_"]
