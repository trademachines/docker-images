FROM openjdk:8-jre-alpine

WORKDIR /usr/share/app

RUN wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz \
    && tar xfz dynamodb_local_latest.tar.gz \
    && rm dynamodb_local_latest.tar.gz

EXPOSE 8000

ENTRYPOINT ["java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar DynamoDBLocal.jar"]
CMD ["-sharedDb"]
