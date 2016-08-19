FROM elasticsearch:2.3

RUN bin/plugin install cloud-aws \
    && bin/plugin install lmenezes/elasticsearch-kopf/2.x \
    && usermod -u 1000 elasticsearch \
    && chown -R elasticsearch:elasticsearch /usr/share/elasticsearch

ENTRYPOINT ["/docker-entrypoint.sh", "--discovery.type=ec2", "--network.publish_host=_ec2_"]
