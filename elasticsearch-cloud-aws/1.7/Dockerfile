FROM elasticsearch:1.7.6

RUN bin/plugin install sydboraa/elasticsearch-cloud-aws \
    && bin/plugin install sydboraa/elasticsearch-kopf \
    && usermod -u 1000 elasticsearch \
    && chown -R elasticsearch:elasticsearch /usr/share/elasticsearch \
    && echo "deb [check-valid-until=no] http://cdn-fastly.deb.debian.org/debian jessie main" > /etc/apt/sources.list.d/jessie.list \
    && echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list \
    && sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list \
    && apt-get -o Acquire::Check-Valid-Until=false update \
    && apt-get install -y --no-install-recommends awscli \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY config ./config
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh", "--discovery.zen.ping.multicast.enabled=false", "--discovery.type=ec2", "--network.publish_host=_ec2_"]
