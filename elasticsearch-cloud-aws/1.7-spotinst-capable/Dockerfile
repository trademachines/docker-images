FROM trademachines/elasticsearch-cloud-aws:1.7

RUN apt-get update && apt-get install -y --no-install-recommends awscli \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY docker-entrypoint.sh /
