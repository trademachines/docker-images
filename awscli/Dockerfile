FROM alpine:3.3

ENV AWS_DEFAULT_REGION=eu-west-1

RUN apk add --no-cache bash gettext python groff less jq py-pip && \
    apk add --no-cache --virtual=build-dependencies wget ca-certificates && \
    apk del build-dependencies && \
    pip install --upgrade pip && \
    pip install awscli

ENTRYPOINT ["aws"]
CMD ["--version"]
