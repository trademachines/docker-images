FROM andreptb/oracle-java:8-alpine

ENV SCALA_VERSION=2.11.8
ENV SBT_VERSION=0.13.11
ENV PATH=${PATH}:/usr/share/scala-${SCALA_VERSION}/bin:/usr/share/sbt/bin

RUN apk --no-cache --update add bash && \
    cd "/tmp" && \
    wget -q "http://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" && \
    wget -q "http://dl.bintray.com/sbt/native-packages/sbt/${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" && \
    gunzip -c "scala-${SCALA_VERSION}.tgz"  | tar x -C /usr/share/ && \
    gunzip -c "sbt-${SBT_VERSION}.tgz" | tar x -C /usr/share/ && \
    ln -s ~/.ivy2 /usr/share/.ivy2 && ln -s ~/.sbt /usr/share/.sbt && \
    rm -rf /tmp/* /usr/share/scala-${SCALA_VERSION}/man

WORKDIR /usr/share/app

ENTRYPOINT ["sbt"]
CMD [ "help" ]
