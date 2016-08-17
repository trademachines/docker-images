FROM elasticsearch:1.7

RUN bin/plugin install elasticsearch/elasticsearch-cloud-aws/2.7.1 \
    && usermod -u 1000 elasticsearch \
    && chown -R elasticsearch:elasticsearch /usr/share/elasticsearch
