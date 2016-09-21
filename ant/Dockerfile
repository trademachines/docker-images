FROM andreptb/oracle-java:8-alpine

ENV ANT_VERSION=1.9.7
ENV PATH=${PATH}:/usr/share/apache-ant-${ANT_VERSION}/bin

RUN cd /tmp \
    && wget -q "https://www.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz" \
    && gunzip -c "apache-ant-${ANT_VERSION}-bin.tar.gz"  | tar x -C /usr/share/

WORKDIR /usr/share/ant

ENTRYPOINT ["ant"]
CMD ["-version"]
