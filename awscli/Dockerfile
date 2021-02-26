FROM alpine:3.12

ENV AWS_DEFAULT_REGION=eu-west-1

RUN apk add --no-cache bash gettext python3 groff less jq py-pip && \
    apk add --no-cache --virtual=build-dependencies wget ca-certificates && \
    apk del build-dependencies && \
    pip3 install --upgrade pip && \
    pip3 install awscli

WORKDIR /usr/share/aws
VOLUME /usr/share/aws

ENTRYPOINT ["aws"]
CMD ["--version"]
